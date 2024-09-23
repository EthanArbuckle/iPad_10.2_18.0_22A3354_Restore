@implementation LPLinkMetadataPresentationTransformer

- (LPLinkMetadataPresentationTransformer)init
{
  LPLinkMetadataPresentationTransformer *v2;
  LPLinkMetadataPresentationTransformer *v3;
  LPLinkMetadataPresentationTransformer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPLinkMetadataPresentationTransformer;
  v2 = -[LPLinkMetadataPresentationTransformer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_scaleFactor = 2.0;
    *(_WORD *)&v2->_allowsTapping = 257;
    v2->_allowsPlayback = 1;
    v4 = v2;
  }

  return v3;
}

- (NSURL)originalURL
{
  NSURL *URL;

  URL = self->_URL;
  if (URL)
    return URL;
  -[LPLinkMetadata originalURL](self->_metadata, "originalURL");
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)canonicalURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[LPLinkMetadata URL](self->_metadata, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[LPLinkMetadataPresentationTransformer originalURL](self, "originalURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSURL *)v6;
}

- (int64_t)rendererStyle
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  int64_t v14;
  BOOL v15;
  void *v16;

  -[LPLinkMetadataPresentationTransformer canonicalURL](self, "canonicalURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPPresentationSpecializations searchQueryForURL:](LPPresentationSpecializations, "searchQueryForURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 4;
  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    -[LPLinkMetadata title](self->_metadata, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      -[LPLinkMetadataPresentationTransformer originalURL](self, "originalURL");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (+[LPPresentationSpecializations isAppleFitnessURL:](LPPresentationSpecializations, "isAppleFitnessURL:", v11))
      {
        v5 = 43;
      }
      else if (+[LPPresentationSpecializations isAppleHealthURL:](LPPresentationSpecializations, "isAppleHealthURL:", v11))
      {
        v5 = 52;
      }
      else
      {
        if (!+[LPPresentationSpecializations isAppleMusicClassicalURL:](LPPresentationSpecializations, "isAppleMusicClassicalURL:", v11))
        {
          v15 = +[LPPresentationSpecializations isAppleBookSeriesURL:](LPPresentationSpecializations, "isAppleBookSeriesURL:", v11);

          if (v15)
            return 57;
          goto LABEL_6;
        }
        v5 = 55;
      }

      return v5;
    }
  }
LABEL_6:
  if (-[LPLinkMetadataPresentationTransformer preferredSizeClass](self, "preferredSizeClass") == 2)
    return 1;
  if (!self->_metadata && self->_complete && self->_allowsTapToLoad)
    return 15;
  v8 = -[LPLinkMetadataPresentationTransformer shouldUseAppClipPresentation](self, "shouldUseAppClipPresentation");
  if (+[LPPresentationSpecializations isMicroblogPost:](LPPresentationSpecializations, "isMicroblogPost:", self->_metadata)&& !v8)
  {
    return 3;
  }
  if (-[LPLinkMetadataPresentationTransformer preferredSizeClass](self, "preferredSizeClass") == 3
    || -[LPLinkMetadataPresentationTransformer preferredSizeClass](self, "preferredSizeClass") == 5)
  {
    return 0;
  }
  -[LPLinkMetadata title](self->_metadata, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    || (-[LPLinkMetadata siteName](self->_metadata, "siteName"),
        (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[LPLinkMetadata image](self->_metadata, "image"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[LPLinkMetadata video](self->_metadata, "video"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[LPLinkMetadata icon](self->_metadata, "icon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      return 2;
  }
  v13 = -[LPLinkMetadata _hasMedia](self->_metadata, "_hasMedia");
  v14 = 41;
  if (!v8)
    v14 = 0;
  if (v13)
    return v14;
  else
    return 1;
}

- (id)mainCaptionBarForStyle:(int64_t)a3
{
  LPCaptionBarPresentationProperties *v5;
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
  int v17;
  char v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v5 = objc_alloc_init(LPCaptionBarPresentationProperties);
  switch(-[LPLinkMetadataPresentationTransformer _rowConfigurationForStyle:](self, "_rowConfigurationForStyle:", a3))
  {
    case 0uLL:
      v17 = stylePrefersSubtitleForOneUpPresentation(a3);
      v18 = v17;
      if (v17
        && (-[LPLinkMetadataPresentationTransformer originalURL](self, "originalURL"),
            (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[LPLinkMetadataPresentationTransformer subtitleForStyle:](self, "subtitleForStyle:", a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v21 = 1;
      }
      else
      {
        -[LPLinkMetadata title](self->_metadata, "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        v21 = 0;
        v20 = 1;
      }
      -[LPCaptionBarPresentationProperties top](v5, "top");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "leading");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setText:", v19);

      if (v20)
      {

        if (!v21)
          goto LABEL_25;
      }
      else if (!v21)
      {
LABEL_25:
        if ((v18 & 1) != 0)
          goto LABEL_4;
        goto LABEL_5;
      }

      if ((v18 & 1) != 0)
        goto LABEL_4;
LABEL_5:
      if (a3 == 57)
      {
        LPLocalizedString(CFSTR(" Books"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties belowBottom](v5, "belowBottom");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "leading");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setText:", v12);

      }
      if (self->_allowsTapping && self->_allowsPlayback)
      {
        if (a3 == 15
          || (-[LPLinkMetadataPresentationTransformer videoForStyle:](self, "videoForStyle:", a3),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v15,
              v15))
        {
          -[LPCaptionBarPresentationProperties setTrailingAccessoryType:](v5, "setTrailingAccessoryType:", 1);
          -[LPCaptionBarPresentationProperties setShouldHighlightIndependently:](v5, "setShouldHighlightIndependently:", 1);
        }
      }
      return v5;
    case 1uLL:
    case 3uLL:
      goto LABEL_2;
    case 2uLL:
      if (-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass") == 8)
      {
        -[LPLinkMetadataPresentationTransformer titleForStyle:](self, "titleForStyle:", a3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties top](v5, "top");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "leading");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setText:", v22);

        -[LPLinkMetadataPresentationTransformer quotedTextForStyleIgnoringAllowsQuotedText:](self, "quotedTextForStyleIgnoringAllowsQuotedText:", a3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (!v25)
        {
          -[LPLinkMetadataPresentationTransformer summaryForStyle:](self, "summaryForStyle:", a3);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[LPCaptionBarPresentationProperties bottom](v5, "bottom");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "leading");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setText:", v26);

        if (!v25)
        -[LPLinkMetadataPresentationTransformer subtitleForStyle:](self, "subtitleForStyle:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties belowBottom](v5, "belowBottom");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "leading");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setText:", v9);
      }
      else
      {
LABEL_2:
        -[LPLinkMetadataPresentationTransformer titleForStyle:](self, "titleForStyle:", a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties top](v5, "top");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "leading");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setText:", v6);

        -[LPLinkMetadataPresentationTransformer subtitleForStyle:](self, "subtitleForStyle:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarPresentationProperties bottom](v5, "bottom");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "leading");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setText:", v9);
      }

LABEL_4:
      goto LABEL_5;
    default:
      goto LABEL_5;
  }
}

- (id)titleForStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  BOOL v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  LPLinkMetadata *metadata;

  -[LPLinkMetadataPresentationTransformer canonicalURL](self, "canonicalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPPresentationSpecializations searchQueryForURL:](LPPresentationSpecializations, "searchQueryForURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    if (a3 == 3)
    {
      -[LPLinkMetadataPresentationTransformer canonicalURL](self, "canonicalURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[LPPresentationSpecializations isSinaWeiboURL:](LPPresentationSpecializations, "isSinaWeiboURL:", v10);

      if (v11)
      {
        v8 = 0;
        goto LABEL_4;
      }
      -[LPLinkMetadataPresentationTransformer canonicalURL](self, "canonicalURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[LPPresentationSpecializations isTweetURL:](LPPresentationSpecializations, "isTweetURL:", v12);

      if (v13)
      {
        -[LPLinkMetadata title](self->_metadata, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "rangeOfString:options:", CFSTR(" on Twitter"), 12);
        v17 = v16;

        if (v17
          || (-[LPLinkMetadata title](self->_metadata, "title"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v18, "rangeOfString:options:", CFSTR(" on X"), 12),
              v20 = v19,
              v18,
              v20))
        {
          -[LPLinkMetadata title](self->_metadata, "title");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "substringToIndex:", v15);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_4;
        }
      }
    }
    -[LPLinkMetadata title](self->_metadata, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    metadata = self->_metadata;
    if (v22)
      -[LPLinkMetadata title](metadata, "title");
    else
      -[LPLinkMetadata siteName](metadata, "siteName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_4:

  return v8;
}

- (NSString)domainName
{
  void *v2;
  void *v3;

  -[LPLinkMetadataPresentationTransformer originalURL](self, "originalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_lp_simplifiedStringForDisplayOnly:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_lp_setStringType:", 1);
  return (NSString *)v3;
}

- (BOOL)shouldUseAppClipPresentation
{
  void *v3;
  void *v4;

  -[LPLinkMetadata associatedApplication](self->_metadata, "associatedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 && -[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass") == 0;
}

- (id)subtitleForStyle:(int64_t)a3
{
  void *v5;
  void *v6;
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

  -[LPLinkMetadataPresentationTransformer originalURL](self, "originalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[LPLinkMetadata summary](self->_metadata, "summary");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (objc_msgSend(v5, "isFileURL"))
  {
    objc_msgSend(v6, "lastPathComponent");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v15 = (void *)v7;
    goto LABEL_25;
  }
  if (objc_msgSend(v6, "_lp_isTelephoneURL"))
  {
    objc_msgSend(v6, "_lp_formattedTelephoneNumber");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (a3 <= 51)
  {
    if (a3 == 41)
    {
      -[LPLinkMetadataPresentationTransformer metadata](self, "metadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "associatedApplication");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "caption");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[LPLinkMetadataPresentationTransformer metadata](self, "metadata");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "associatedApplication");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "caption");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (a3 != 43)
      goto LABEL_23;
    -[LPLinkMetadataPresentationTransformer metadata](self, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "summary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_23;
  }
  else
  {
    if (a3 != 52)
    {
      if (a3 == 55)
      {
        LPLocalizedString(CFSTR(" Music Classical"));
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      if (a3 == 57)
      {
        -[LPLinkMetadataPresentationTransformer metadata](self, "metadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "summary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          goto LABEL_18;
      }
LABEL_23:
      -[LPLinkMetadataPresentationTransformer domainName](self, "domainName");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    -[LPLinkMetadataPresentationTransformer metadata](self, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "summary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_23;
  }
LABEL_18:
  -[LPLinkMetadataPresentationTransformer metadata](self, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "summary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

LABEL_25:
  return v15;
}

- (id)summaryForStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  void *v9;

  -[LPLinkMetadataPresentationTransformer originalURL](self, "originalURL", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_3;
  -[LPLinkMetadata summary](self->_metadata, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata title](self->_metadata, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_lp_similarityToString:", v6);
  v8 = v7;

  if (v8 <= 0.6)
  {
    -[LPLinkMetadata summary](self->_metadata, "summary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_3:
    v9 = 0;
  }

  return v9;
}

- (id)domainNameForIndicator
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

  -[LPLinkMetadataPresentationTransformer originalURL](self, "originalURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "isFileURL") & 1) != 0 || (objc_msgSend(v4, "_lp_isTelephoneURL") & 1) != 0)
    goto LABEL_8;
  -[LPLinkMetadataPresentationTransformer metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "associatedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    goto LABEL_8;
  }
  -[LPLinkMetadataPresentationTransformer metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "associatedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "caption");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  -[LPLinkMetadataPresentationTransformer domainName](self, "domainName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v11;
}

- (BOOL)_hasNonMicroblogQuotedTextForStyle:(int64_t)a3
{
  void *v4;
  BOOL v5;

  if (!styleSupportsQuotedText(a3)
    || !sizeClassAllowsMedia(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass")))
  {
    return 0;
  }
  -[LPLinkMetadata selectedText](self->_metadata, "selectedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

- (BOOL)_shouldUseMicroblogQuotedTextForStyle:(int64_t)a3
{
  return a3 == 3
      || +[LPPresentationSpecializations isMicroblogPost:](LPPresentationSpecializations, "isMicroblogPost:", self->_metadata);
}

- (id)quotedTextForStyleIgnoringAllowsQuotedText:(int64_t)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;

  -[LPLinkMetadata summary](self->_metadata, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LPLinkMetadataPresentationTransformer _shouldUseMicroblogQuotedTextForStyle:](self, "_shouldUseMicroblogQuotedTextForStyle:", a3))
  {
    -[LPLinkMetadataPresentationTransformer URL](self, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[LPPresentationSpecializations isTweetURL:](LPPresentationSpecializations, "isTweetURL:", v6);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^[\\p{Quotation_Mark}](.*)[\\p{Quotation_Mark}]$"), 8, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "numberOfRanges") == 2)
      {
        v10 = objc_msgSend(v9, "rangeAtIndex:", 1);
        objc_msgSend(v5, "substringWithRange:", v10, v11);
        v12 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v12;
      }

    }
    v13 = v5;
    v5 = v13;
  }
  else
  {
    -[LPLinkMetadata selectedText](self->_metadata, "selectedText");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

- (id)quotedTextForStyle:(int64_t)a3
{
  void *v5;

  if (styleSupportsQuotedText(a3)
    && sizeClassAllowsMedia(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass")))
  {
    -[LPLinkMetadataPresentationTransformer quotedTextForStyleIgnoringAllowsQuotedText:](self, "quotedTextForStyleIgnoringAllowsQuotedText:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_lastResortIcon
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  double scaleFactor;
  NSString *v21;
  double v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  id v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  LPImageProperties *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;

  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[LPLinkMetadata specialization](self->_metadata, "specialization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EE5E9028);

    if (v6)
    {
      -[LPLinkMetadata specialization](self->_metadata, "specialization");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fallbackIconForTransformer:", self);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8)
        return v8;
    }
  }
  -[LPLinkMetadataPresentationTransformer originalURL](self, "originalURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_lp_isHTTPFamilyURL");

  if ((v10 & 1) == 0)
  {
    -[LPLinkMetadataPresentationTransformer originalURL](self, "originalURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isFileURL");

    if (v15)
    {
      +[LPResources fileIcon](LPResources, "fileIcon");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[LPLinkMetadataPresentationTransformer originalURL](self, "originalURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "_lp_isTelephoneURL");

      if (!v18)
        goto LABEL_12;
      +[LPResources telephoneIcon](LPResources, "telephoneIcon");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (id)v16;
    if (v16)
      return v8;
LABEL_12:
    -[LPLinkMetadataPresentationTransformer originalURL](self, "originalURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19
      || (-[LPLinkMetadata specialization](self->_metadata, "specialization"),
          (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else if (+[LPApplicationIdentification isMobileNotes](LPApplicationIdentification, "isMobileNotes"))
    {
      +[LPResources textIcon](LPResources, "textIcon");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
        return v8;
    }
    -[LPLinkMetadataPresentationTransformer sourceContextIcon](self, "sourceContextIcon");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
      return v8;
    if (-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass") != 2)
      goto LABEL_5;
    scaleFactor = self->_scaleFactor;
    v21 = self->_sourceBundleIdentifier;
    if (iconForApplication_applicationIcon)
    {
      v22 = *(double *)&iconForApplication_applicationIconScaleFactor;
      if (*(double *)&iconForApplication_applicationIconScaleFactor == scaleFactor
        && ((NSString *)iconForApplication_applicationBundleIdentifier == v21
         || (objc_msgSend((id)iconForApplication_applicationBundleIdentifier, "_lp_isEqualIgnoringCase:", v21, *(double *)&iconForApplication_applicationIconScaleFactor) & 1) != 0))
      {
        goto LABEL_34;
      }
    }
    if (v21
      && (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", v22),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v23, "bundleIdentifier"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "_lp_isEqualIgnoringCase:", v21),
          v24,
          v23,
          !v25))
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v21);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D3A820], "applicationIcon", v22);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (id)v26;
    if (v26)
    {
      v28 = objc_alloc(MEMORY[0x1E0D3A830]);
      +[LPTheme largestIconSizeInPoints](LPTheme, "largestIconSizeInPoints");
      v30 = v29;
      +[LPTheme largestIconSizeInPoints](LPTheme, "largestIconSizeInPoints");
      v32 = (void *)objc_msgSend(v28, "initWithSize:scale:", v30, v31, scaleFactor);
      objc_msgSend(v32, "setShouldApplyMask:", 0);
      objc_msgSend(v8, "prepareImageForDescriptor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "CGImage");
      if (v34)
      {
        v35 = objc_alloc_init(LPImageProperties);
        -[LPImageProperties setType:](v35, "setType:", 1);
        v36 = -[LPImage _initWithCGImage:properties:]([LPImage alloc], "_initWithCGImage:properties:", v34, v35);
        v37 = (void *)iconForApplication_applicationIcon;
        iconForApplication_applicationIcon = (uint64_t)v36;

        v38 = -[NSString copy](v21, "copy");
        v39 = (void *)iconForApplication_applicationBundleIdentifier;
        iconForApplication_applicationBundleIdentifier = v38;

        iconForApplication_applicationIconScaleFactor = *(_QWORD *)&scaleFactor;
LABEL_34:
        v8 = (id)iconForApplication_applicationIcon;
        goto LABEL_36;
      }

      v8 = 0;
    }
LABEL_36:

    if (v8)
      return v8;
  }
LABEL_5:
  -[LPLinkMetadataPresentationTransformer sourceContextIcon](self, "sourceContextIcon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    +[LPResources safariIcon](LPResources, "safariIcon");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v13;

  return v8;
}

- (id)imageForStyle:(int64_t)a3 imageMetadata:(id)a4 icon:(id *)a5 alternateImages:(id *)a6
{
  unint64_t v10;
  _BOOL4 v11;
  int v12;
  int v13;
  void *v14;
  BOOL v15;
  int v16;
  _BOOL4 v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  LPImageRemoteURLRepresentation *v24;
  void *v25;
  void *v26;
  LPImageRemoteURLRepresentation *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  LPImageRemoteURLRepresentation *v32;
  void *v33;
  LPImageRemoteURLRepresentation *v34;
  void *v35;
  int v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  int v40;
  int v41;
  void *v42;
  BOOL v43;
  _BOOL4 v44;
  id v45;
  _BOOL4 v47;
  _BOOL4 v48;
  _BOOL4 v49;
  id *v50;
  int v51;
  id v52;
  LPImageRemoteURLRepresentation *v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v52 = a4;
  v48 = -[LPLinkMetadataPresentationTransformer isComplete](self, "isComplete");
  v10 = -[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass");
  v51 = sizeClassAllowsIconWithPlaceholderImage(v10);
  v11 = sizeClassRequiresLargeMedia(v10);
  if ((styleSupportsIcon(a3) & 1) != 0)
    v12 = 1;
  else
    v12 = sizeClassPrefersIcon(v10);
  v50 = a5;
  v47 = v11;
  if (styleSupportsImage(a3))
    v13 = sizeClassPrefersIcon(v10) ^ 1;
  else
    v13 = 0;
  if ((stylePrefersImageAsIcon(a3) & 1) != 0 || (sizeClassPrefersImageAsIcon(v10) & 1) != 0)
  {
    v49 = 1;
  }
  else if (sizeClassSupportsIconHoisting(v10))
  {
    -[LPLinkMetadataPresentationTransformer canonicalURL](self, "canonicalURL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = +[LPPresentationSpecializations isGoogleURL:](LPPresentationSpecializations, "isGoogleURL:", v39);

  }
  else
  {
    v49 = 0;
  }
  -[LPLinkMetadataPresentationTransformer quotedTextForStyle:](self, "quotedTextForStyle:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = v10 == 5;
  else
    v15 = 0;
  v16 = v15;

  v17 = -[LPLinkMetadataPresentationTransformer _hasNonMicroblogQuotedTextForStyle:](self, "_hasNonMicroblogQuotedTextForStyle:", a3);
  v18 = v13 & ~v16;
  v19 = v17 | v16 | v12;
  if ((v19 | v18) != 1)
  {
    v37 = 0;
    goto LABEL_29;
  }
  -[LPLinkMetadata icon](self->_metadata, "icon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  imageOnlyIfViable(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[LPLinkMetadata iconMetadata](self->_metadata, "iconMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "URL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = [LPImageRemoteURLRepresentation alloc];
    -[LPLinkMetadata iconMetadata](self->_metadata, "iconMetadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "URL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[LPImageRemoteURLRepresentation initWithScale:URL:](v24, "initWithScale:URL:", 1, v26);
    v54[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "set_remoteURLsForEmailCompatibleOutput:", v28);

  }
  -[LPLinkMetadata image](self->_metadata, "image");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  imageOnlyIfViable(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    -[LPLinkMetadata alternateImages](self->_metadata, "alternateImages");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v52, "URL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = [LPImageRemoteURLRepresentation alloc];
    objc_msgSend(v52, "URL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[LPImageRemoteURLRepresentation initWithScale:URL:](v32, "initWithScale:URL:", 1, v33);
    v53 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "set_remoteURLsForEmailCompatibleOutput:", v35);

  }
  v36 = v17 || v49;
  if (!v30)
    v36 = 0;
  if (v36 == 1)
  {

    if (!a6)
    {
      v37 = 0;
LABEL_46:
      v21 = v30;
      goto LABEL_49;
    }
LABEL_45:
    v37 = 0;
    *a6 = 0;
    goto LABEL_46;
  }
  if (v30)
  {
    v40 = objc_msgSend(v30, "_isLowResolutionAsImage") ^ 1;
    if (v21)
      v40 = 1;
    v41 = v40 | !v48;
    if (v41)
      v37 = (unint64_t)v30;
    else
      v37 = 0;
    if (v48)
      v42 = v30;
    else
      v42 = 0;
    if (!v40)
      v21 = v42;
    if ((v41 & 1) == 0 && a6)
      goto LABEL_45;
  }
  else
  {
    v37 = 0;
  }
LABEL_49:
  if (((v19 ^ 1 | v18) & 1) != 0)
  {
    v38 = (uint64_t)v21;
  }
  else
  {
    if (v21)
      v43 = 0;
    else
      v43 = v48;
    if (v43 || v37 && objc_msgSend(v21, "_isLowResolutionAsIconWithScaleFactor:", self->_scaleFactor))
    {
      v38 = (uint64_t)(id)v37;

      if (a6)
        *a6 = 0;
    }
    else
    {
      v38 = (uint64_t)v21;
    }

    v37 = 0;
  }
  if (((v19 | v18 ^ 1) & 1) == 0)
  {
    v44 = v47;
    if (v37)
      v44 = 0;
    if ((v51 & v44 & 1) != 0)
    {
      v37 = 0;
      goto LABEL_66;
    }

LABEL_29:
    v38 = 0;
  }
LABEL_66:
  if (!(v37 | v38))
  {
    -[LPLinkMetadataPresentationTransformer _lastResortIcon](self, "_lastResortIcon");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  if ((v19 | v51) == 1)
    *v50 = objc_retainAutorelease((id)v38);
  if (v18)
    v45 = (id)v37;
  else
    v45 = 0;

  return v45;
}

- (id)videoForStyle:(int64_t)a3
{
  void *v4;

  if (styleSupportsVideo(a3)
    && sizeClassAllowsMedia(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass")))
  {
    -[LPLinkMetadata video](self->_metadata, "video");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)audioForStyle:(int64_t)a3
{
  return -[LPLinkMetadata audio](self->_metadata, "audio", a3);
}

- (id)arAsset
{
  void *v3;

  if (canDisplayARAssets()
    && sizeClassAllowsMedia(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass")))
  {
    -[LPLinkMetadata arAsset](self->_metadata, "arAsset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)backgroundColorForStyle:(int64_t)a3
{
  int v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;

  v5 = sizeClassAllowsBackgroundColor(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass"));
  v6 = 0;
  if (a3 == 3 && v5)
  {
    -[LPLinkMetadataPresentationTransformer canonicalURL](self, "canonicalURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[LPPresentationSpecializations isTweetURL:](LPPresentationSpecializations, "isTweetURL:", v7);

    if (v8)
    {
      +[LPResources tweetBackgroundColor](LPResources, "tweetBackgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[LPLinkMetadataPresentationTransformer canonicalURL](self, "canonicalURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[LPPresentationSpecializations isSinaWeiboURL:](LPPresentationSpecializations, "isSinaWeiboURL:", v9);

      if (v10)
      {
        +[LPResources weiboBackgroundColor](LPResources, "weiboBackgroundColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
    }
  }
  return v6;
}

- (id)commonPresentationPropertiesForStyle:(int64_t)a3
{
  LPWebLinkPresentationProperties *v5;
  void *v6;

  v5 = objc_alloc_init(LPWebLinkPresentationProperties);
  -[LPWebLinkPresentationProperties setPreliminary:](v5, "setPreliminary:", !self->_complete);
  -[LPWebLinkPresentationProperties setStyle:](v5, "setStyle:", a3);
  -[LPLinkMetadataPresentationTransformer quotedTextForStyle:](self, "quotedTextForStyle:", -[LPWebLinkPresentationProperties style](v5, "style"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPWebLinkPresentationProperties setQuotedText:](v5, "setQuotedText:", v6);

  return v5;
}

- (id)unspecializedPresentationProperties
{
  return -[LPLinkMetadataPresentationTransformer unspecializedPresentationPropertiesForStyle:](self, "unspecializedPresentationPropertiesForStyle:", -[LPLinkMetadataPresentationTransformer rendererStyle](self, "rendererStyle"));
}

- (id)unspecializedPresentationPropertiesForStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  LPIndeterminateProgressSpinnerPresentationProperties *v34;
  void *v35;
  id v37;
  id v38;

  -[LPLinkMetadataPresentationTransformer commonPresentationPropertiesForStyle:](self, "commonPresentationPropertiesForStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadataPresentationTransformer mainCaptionBarForStyle:](self, "mainCaptionBarForStyle:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCaptionBar:", v6);

  -[LPLinkMetadataPresentationTransformer backgroundColorForStyle:](self, "backgroundColorForStyle:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v7);

  -[LPLinkMetadata imageMetadata](self->_metadata, "imageMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = 0;
  -[LPLinkMetadataPresentationTransformer imageForStyle:imageMetadata:icon:alternateImages:](self, "imageForStyle:imageMetadata:icon:alternateImages:", a3, v8, &v38, &v37);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v38;
  v11 = v37;
  objc_msgSend(v5, "setImage:", v9);

  objc_msgSend(v5, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v5, "setAlternateImages:", v11);

    v11 = 0;
  }
  -[LPLinkMetadataPresentationTransformer videoForStyle:](self, "videoForStyle:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVideo:", v13);

  -[LPLinkMetadataPresentationTransformer audioForStyle:](self, "audioForStyle:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudio:", v14);

  -[LPLinkMetadataPresentationTransformer arAsset](self, "arAsset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArAsset:", v15);

  objc_msgSend(v5, "audio");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v5, "audio");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPInlineMediaPlaybackInformation audioFilePlaybackInformationWithAudio:](LPInlineMediaPlaybackInformation, "audioFilePlaybackInformationWithAudio:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setInlinePlaybackInformation:", v18);
  }
  if ((styleSupportsStackedIcons(a3) & 1) == 0)
  {

    v11 = 0;
  }
  objc_msgSend(v5, "image");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19
    || (objc_msgSend(v5, "video"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v5, "quotedText"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v5, "arAsset"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v20 = 1;
  }
  else
  {
    if (!sizeClassRequiresLargeMedia(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass")))
    {
      v20 = 1;
      if (!v10)
        goto LABEL_18;
      goto LABEL_13;
    }
    +[LPResources safariIcon](LPResources, "safariIcon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v19);
    v20 = 0;
  }

  if (!v10)
    goto LABEL_18;
LABEL_13:
  if ((v20 | objc_msgSend(v10, "_isFallbackIcon") ^ 1) == 1)
  {
    if (-[LPLinkMetadataPresentationTransformer _prefersLeadingIconWithStyle:](self, "_prefersLeadingIconWithStyle:", a3))
    {
      objc_msgSend(v5, "captionBar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setLeadingIcon:", v10);

      objc_msgSend(v5, "captionBar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAdditionalLeadingIcons:", v11);
    }
    else
    {
      objc_msgSend(v5, "captionBar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTrailingIcon:", v10);

      objc_msgSend(v5, "captionBar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAdditionalTrailingIcons:", v11);
    }

  }
LABEL_18:
  if (a3 == 41)
  {
    -[LPLinkMetadata associatedApplication](self->_metadata, "associatedApplication");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "icon");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setLeadingIcon:", v25);

    objc_msgSend(v5, "captionBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setShouldHighlightIndependently:", 1);

    if (self->_allowsTapping)
    {
      -[LPLinkMetadata associatedApplication](self->_metadata, "associatedApplication");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "action");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        -[LPLinkMetadata associatedApplication](self->_metadata, "associatedApplication");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "action");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "captionBar");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setButtonCaption:", v31);

      }
    }
    -[LPLinkMetadataPresentationTransformer domainNameForIndicator](self, "domainNameForIndicator");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDomainNameForIndicator:", v33);

  }
  v34 = objc_alloc_init(LPIndeterminateProgressSpinnerPresentationProperties);
  -[LPLinkMetadataPresentationTransformer subtitleForStyle:](self, "subtitleForStyle:", a3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPIndeterminateProgressSpinnerPresentationProperties setText:](v34, "setText:", v35);

  objc_msgSend(v5, "setProgressSpinner:", v34);
  return v5;
}

- (id)presentationProperties
{
  void *v2;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  unint64_t v14;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  _BOOL4 allowsPlayback;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  LPImagePresentationProperties *v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  LPWebLinkPresentationProperties *v86;
  LPCaptionBarPresentationProperties *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v109;
  void *v110;
  void *v111;
  _QWORD v112[4];
  id v113;

  v4 = -[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass");
  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[LPLinkMetadata specialization](self->_metadata, "specialization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v6, "conformsToProtocol:", &unk_1EE5E8598);

    if ((_DWORD)v2)
    {
      -[LPLinkMetadata specialization](self->_metadata, "specialization");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkMetadataPresentationTransformer originalURL](self, "originalURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        && ((-[LPLinkMetadataPresentationTransformer originalURL](self, "originalURL"),
             v2 = (void *)objc_claimAutoreleasedReturnValue(),
             v9 = objc_msgSend(v7, "canGeneratePresentationPropertiesForURL:", v2),
             v4 == 2)
          ? (v10 = 1)
          : (v10 = v9),
            v2,
            v8,
            v10 != 1))
      {

      }
      else
      {
        objc_msgSend(v7, "presentationPropertiesForTransformer:", self);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          goto LABEL_12;
      }
    }
  }
  -[LPLinkMetadataPresentationTransformer unspecializedPresentationProperties](self, "unspecializedPresentationProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  if ((sizeClassAllowsMedia(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass")) & 1) == 0)
  {
    objc_msgSend(v11, "setImage:", 0);
    objc_msgSend(v11, "setVideo:", 0);
  }
  if (!self->_allowsPlayback)
  {
    objc_msgSend(v11, "setInlinePlaybackInformation:", 0);
    objc_msgSend(v11, "setVideo:", 0);
    objc_msgSend(v11, "setAudio:", 0);
  }
  if ((sizeClassAllowsMedia(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass")) & 1) == 0)
    objc_msgSend(v11, "setQuotedText:", 0);
  if (!sizeClassAllowsInlinePlayback(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass"))
    || (objc_msgSend(v11, "inlinePlaybackInformation"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "type"),
        v13 = canPlayInlineMediaType(),
        v12,
        (v13 & 1) == 0))
  {
    objc_msgSend(v11, "setInlinePlaybackInformation:", 0);
  }
  v14 = -[LPLinkMetadataPresentationTransformer _rowConfigurationForStyle:](self, "_rowConfigurationForStyle:", objc_msgSend(v11, "style"));
  if (v14 == 1)
  {
    objc_msgSend(v11, "captionBar");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "aboveTop");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leading");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setText:", 0);

    objc_msgSend(v11, "captionBar");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "aboveTop");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailing");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setText:", 0);

    objc_msgSend(v11, "captionBar");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "belowBottom");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leading");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setText:", 0);

    objc_msgSend(v11, "captionBar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "belowBottom");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailing");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setText:", 0);
    goto LABEL_25;
  }
  if (!v14)
  {
    objc_msgSend(v11, "captionBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "aboveTop");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leading");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", 0);

    objc_msgSend(v11, "captionBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "aboveTop");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailing");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", 0);

    objc_msgSend(v11, "captionBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottom");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leading");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setText:", 0);

    objc_msgSend(v11, "captionBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottom");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailing");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", 0);

    objc_msgSend(v11, "captionBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "belowBottom");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leading");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", 0);

    objc_msgSend(v11, "captionBar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "belowBottom");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailing");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setText:", 0);
LABEL_25:

  }
  if (-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass") == 2)
  {
    objc_msgSend(v11, "captionBar");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "aboveTop");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v110, "hasAnyContent");
    objc_msgSend(v11, "captionBar");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "top");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "hasAnyContent");
    objc_msgSend(v11, "captionBar");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bottom");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "hasAnyContent");
    objc_msgSend(v11, "captionBar");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "belowBottom");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v43 + v41 + v46 + objc_msgSend(v2, "hasAnyContent");

    if (v48 == 1)
    {
      objc_msgSend(v11, "captionBar");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "applyToAllCaptions:", &__block_literal_global_22);

    }
  }
  objc_msgSend(v11, "inlinePlaybackInformation");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    allowsPlayback = self->_allowsPlayback;

    if (allowsPlayback)
    {
      objc_msgSend(v11, "captionBar");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setTrailingIcon:", 0);

      objc_msgSend(v11, "captionBar");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setAdditionalTrailingIcons:", 0);

    }
  }
  objc_msgSend(v11, "captionBar");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "button");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    objc_msgSend(v11, "captionBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "button");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "type");

    if (v57 == 1)
    {
      objc_msgSend(v11, "captionBar");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setTrailingIcon:", 0);

      objc_msgSend(v11, "captionBar");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setAdditionalTrailingIcons:", 0);

      objc_msgSend(v11, "setInlinePlaybackInformation:", 0);
    }
  }
  else
  {

  }
  if (sizeClassSupportsIconHoisting(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass")))
  {
    if (!-[LPLinkMetadataPresentationTransformer hasMediaWithProperties:](self, "hasMediaWithProperties:", v11))
    {
      objc_msgSend(v11, "captionBar");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "leadingIcon");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v61;
      if (!v61)
      {
        objc_msgSend(v11, "captionBar");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "trailingIcon");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "setImage:", v62);
      if (!v61)
      {

      }
      v63 = objc_alloc_init(LPImagePresentationProperties);
      +[LPTheme placeholderIconSizeInPoints](LPTheme, "placeholderIconSizeInPoints");
      v65 = v64;
      +[LPTheme placeholderIconSizeInPoints](LPTheme, "placeholderIconSizeInPoints");
      -[LPImagePresentationProperties setFixedSize:](v63, "setFixedSize:", v65, v66);
      -[LPImagePresentationProperties setScalingMode:](v63, "setScalingMode:", 3);
      -[LPImagePresentationProperties setFilter:](v63, "setFilter:", 3);
      objc_msgSend(v11, "setImageProperties:", v63);

    }
    objc_msgSend(v11, "captionBar");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "removeAllIcons");

  }
  if (-[LPLinkRendererSizeClassParameters neverShowIcon](self->_sizeClassParameters, "neverShowIcon"))
  {
    objc_msgSend(v11, "captionBar");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "removeAllIcons");

    objc_msgSend(v11, "mediaTopCaptionBar");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "removeAllIcons");

    objc_msgSend(v11, "mediaBottomCaptionBar");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "removeAllIcons");

  }
  if (sizeClassRequiresLargeMedia(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass"))
    && !-[LPLinkMetadataPresentationTransformer hasMediaWithProperties:](self, "hasMediaWithProperties:", v11))
  {
    -[LPLinkMetadataPresentationTransformer _lastResortIcon](self, "_lastResortIcon");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v71);

  }
  v72 = -[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass");
  objc_msgSend(v11, "style");
  if (sizeClassRequiresLeadingIcon(v72))
  {
    objc_msgSend(v11, "captionBar");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "leadingIcon");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v74)
    {
      -[LPLinkMetadataPresentationTransformer _lastResortIcon](self, "_lastResortIcon");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "captionBar");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setLeadingIcon:", v75);

    }
  }
  if (sizeClassAllowsApplicationBadge(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass"))
    || styleRequiresApplicationBadge(objc_msgSend(v11, "style")))
  {
    -[LPLinkMetadata sourceApplication](self->_metadata, "sourceApplication");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v77)
    {
      -[LPLinkMetadata specialization](self->_metadata, "specialization");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (v78
        && (-[LPLinkMetadata specialization](self->_metadata, "specialization"),
            v79 = (void *)objc_claimAutoreleasedReturnValue(),
            v80 = objc_msgSend(v79, "conformsToProtocol:", &unk_1EE5E88A8),
            v79,
            v78,
            v80))
      {
        -[LPLinkMetadata specialization](self->_metadata, "specialization");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "sourceApplicationMetadataForTransformer:", self);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v77 = 0;
      }
    }
    objc_msgSend(v11, "captionBar");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "leadingIcon");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (v83)
    {
      objc_msgSend(v77, "icon");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v84)
      {
LABEL_63:

        goto LABEL_64;
      }
      objc_msgSend(v77, "icon");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "captionBar");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setLeadingIconBadge:", v82);

    }
    goto LABEL_63;
  }
LABEL_64:
  if (!-[LPLinkRendererSizeClassParameters onlyShowIcon](self->_sizeClassParameters, "onlyShowIcon"))
    goto LABEL_71;
  v86 = objc_alloc_init(LPWebLinkPresentationProperties);
  -[LPWebLinkPresentationProperties setPreliminary:](v86, "setPreliminary:", objc_msgSend(v11, "isPreliminary"));
  -[LPWebLinkPresentationProperties setStyle:](v86, "setStyle:", objc_msgSend(v11, "style"));
  v87 = objc_alloc_init(LPCaptionBarPresentationProperties);
  -[LPWebLinkPresentationProperties setCaptionBar:](v86, "setCaptionBar:", v87);

  objc_msgSend(v11, "captionBar");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "leadingIcon");
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    objc_msgSend(v11, "captionBar");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "leadingIcon");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPWebLinkPresentationProperties captionBar](v86, "captionBar");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setLeadingIcon:", v91);

    objc_msgSend(v11, "captionBar");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "leadingIconProperties");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPWebLinkPresentationProperties captionBar](v86, "captionBar");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setLeadingIconProperties:", v94);

    objc_msgSend(v11, "captionBar");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "additionalLeadingIcons");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPWebLinkPresentationProperties captionBar](v86, "captionBar");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setAdditionalLeadingIcons:", v97);
LABEL_69:

    goto LABEL_70;
  }
  objc_msgSend(v11, "captionBar");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "trailingIcon");
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
  {
    objc_msgSend(v11, "captionBar");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "trailingIcon");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPWebLinkPresentationProperties captionBar](v86, "captionBar");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setTrailingIcon:", v102);

    objc_msgSend(v11, "captionBar");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "trailingIconProperties");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPWebLinkPresentationProperties captionBar](v86, "captionBar");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setTrailingIconProperties:", v105);

    objc_msgSend(v11, "captionBar");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "additionalTrailingIcons");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPWebLinkPresentationProperties captionBar](v86, "captionBar");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setAdditionalTrailingIcons:", v97);
    goto LABEL_69;
  }
LABEL_70:

  v11 = v86;
LABEL_71:
  -[LPLinkMetadataPresentationTransformer _propagateDominantBackgroundColorToDependentPropertiesIfNeeded:](self, "_propagateDominantBackgroundColorToDependentPropertiesIfNeeded:", v11);
  if (-[LPLinkRendererSizeClassParameters useDominantColorForText](self->_sizeClassParameters, "useDominantColorForText"))
  {
    -[LPLinkMetadataPresentationTransformer _populateDominantBackgroundColorForPropertiesIfNeeded:](self, "_populateDominantBackgroundColorForPropertiesIfNeeded:", v11);
    objc_msgSend(v11, "captionBar");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v112[0] = MEMORY[0x1E0C809B0];
    v112[1] = 3221225472;
    v112[2] = __63__LPLinkMetadataPresentationTransformer_presentationProperties__block_invoke_77;
    v112[3] = &unk_1E44A9FF0;
    v113 = v11;
    objc_msgSend(v107, "applyToAllCaptions:", v112);

  }
  if (self->_mediaOverlayIcon)
    -[LPLinkMetadataPresentationTransformer _populatePropertiesForMediaOverlayIcon:](self, "_populatePropertiesForMediaOverlayIcon:", v11);
  return v11;
}

void __63__LPLinkMetadataPresentationTransformer_presentationProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  +[LPTheme primaryLabelColor](LPTheme, "primaryLabelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v2);

}

void __63__LPLinkMetadataPresentationTransformer_presentationProperties__block_invoke_77(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dominantImageBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v3);

}

- (BOOL)hasMediaWithProperties:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "video");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || (objc_msgSend(v4, "image"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "_isFallbackIcon")))
    {
      objc_msgSend(v4, "alternateImages");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "count"))
      {
        objc_msgSend(v4, "arAsset");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          objc_msgSend(v4, "quotedText");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v11 != 0;

          if (!v7)
            goto LABEL_11;
          goto LABEL_10;
        }

      }
      v6 = 1;
      if (!v7)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v6 = 1;
    }
LABEL_10:

    goto LABEL_11;
  }
  v6 = 1;
LABEL_12:

  return v6;
}

- (BOOL)hasMedia
{
  LPLinkMetadataPresentationTransformer *v2;
  void *v3;

  v2 = self;
  -[LPLinkMetadataPresentationTransformer presentationProperties](self, "presentationProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[LPLinkMetadataPresentationTransformer hasMediaWithProperties:](v2, "hasMediaWithProperties:", v3);

  return (char)v2;
}

- (id)_preferredBackgroundColorImageSourceForProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "captionBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingIcon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v6 = v8;
    }
    else
    {
      objc_msgSend(v3, "captionBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trailingIcon");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (BOOL)_useVisualRefreshCaptionBarColorsForProperties:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  if ((sizeClassUsesVisualRefresh(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass")) & 1) == 0
    || !styleAllowsVisualRefresh(objc_msgSend(v4, "style"))
    || styleUsesBlurBackgroundForCaptionBar(objc_msgSend(v4, "style")))
  {
    goto LABEL_4;
  }
  objc_msgSend(v4, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_7;
  if (!self->_hasOverriddenBackgroundColor)
  {
    -[LPLinkMetadataPresentationTransformer _preferredBackgroundColorImageSourceForProperties:](self, "_preferredBackgroundColorImageSourceForProperties:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      objc_msgSend(v8, "platformImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "_lp_isSymbolImage") & 1) != 0 || (objc_msgSend(v7, "_isPrecomposedAppIcon") & 1) != 0)
      {

      }
      else
      {
        objc_msgSend(v7, "properties");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "type");

        if (!v11)
        {
          v5 = 1;
          goto LABEL_8;
        }
      }
    }
LABEL_7:
    v5 = 0;
LABEL_8:

    goto LABEL_5;
  }
LABEL_4:
  v5 = 0;
LABEL_5:

  return v5;
}

- (void)_populateDominantBackgroundColorForPropertiesIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v17 = a3;
  objc_msgSend(v17, "dominantImageBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[LPLinkMetadataPresentationTransformer _preferredBackgroundColorImageSourceForProperties:](self, "_preferredBackgroundColorImageSourceForProperties:", v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v17, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_darkInterfaceAlternativeImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "platformImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "_lp_isSymbolImage") & 1) == 0)
    {
      objc_msgSend(v7, "platformImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "_lp_isSymbolImage");

      if ((v10 & 1) != 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      v11 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke;
      v25[3] = &unk_1E44A9A00;
      v26 = v5;
      __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke((uint64_t)v25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_2;
      v22[3] = &unk_1E44AA018;
      v23 = v7;
      v13 = v12;
      v24 = v13;
      __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_2((uint64_t)v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13 && v14)
      {
        v18[0] = v11;
        v18[1] = 3221225472;
        v18[2] = __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_4;
        v18[3] = &unk_1E44AA080;
        v18[4] = self;
        v19 = v14;
        v20 = v13;
        v21 = &__block_literal_global_80_0;
        __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_4((uint64_t)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setDominantImageBackgroundColor:", v16);

      }
      v8 = v26;
    }

    goto LABEL_10;
  }
LABEL_12:

}

id __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dominantColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dominantColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "platformImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_lp_dominantColors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

id __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dominantColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dominantColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "platformImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_lp_dominantColors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v5;
    if (!*(_QWORD *)(a1 + 32))
      v9 = *(void **)(a1 + 40);
    v6 = v9;
  }
  v10 = v6;

  return v10;
}

id __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;

  v6 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v3 = 0.0;
  objc_msgSend(a2, "getHue:saturation:brightness:alpha:", &v6, &v5, &v4, &v3);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v6, v5, v4 + dbl_1A0D661F0[v4 < 0.5], v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_4(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "effectiveAppearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_lp_prefersDarkInterface");

  v4 = 48;
  if (v3)
    v4 = 40;
  v5 = *(id *)(a1 + v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "useDominantColorForText") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_lp_systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v3;
    objc_msgSend(v7, "_lp_colorForcingUserInterfaceStyle:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "contrastsWith:", v9))
    {
      v10 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_lp_colorForcingUserInterfaceStyle:", v8);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (void)_propagateDominantBackgroundColorToDependentPropertiesIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  LPPlayButtonPresentationProperties *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[LPLinkMetadataPresentationTransformer _useVisualRefreshCaptionBarColorsForProperties:](self, "_useVisualRefreshCaptionBarColorsForProperties:", v11))
  {
    -[LPLinkMetadataPresentationTransformer _populateDominantBackgroundColorForPropertiesIfNeeded:](self, "_populateDominantBackgroundColorForPropertiesIfNeeded:", v11);
    objc_msgSend(v11, "captionBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(LPPlayButtonPresentationProperties);
      objc_msgSend(v11, "captionBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPlayButton:", v6);

    }
    objc_msgSend(v11, "dominantImageBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "captionBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccentColor:", v8);

  }
}

- (void)_populatePropertiesForMediaOverlayIcon:(id)a3
{
  void *v4;
  LPCaptionBarPresentationProperties *v5;
  LPImagePresentationProperties *v6;
  LPImage *mediaOverlayIcon;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[LPLinkMetadataPresentationTransformer _populateDominantBackgroundColorForPropertiesIfNeeded:](self, "_populateDominantBackgroundColorForPropertiesIfNeeded:");
  objc_msgSend(v10, "mediaBottomCaptionBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(LPCaptionBarPresentationProperties);
    objc_msgSend(v10, "setMediaBottomCaptionBar:", v5);

  }
  v6 = objc_alloc_init(LPImagePresentationProperties);
  -[LPImagePresentationProperties setFilter:](v6, "setFilter:", 1);
  -[LPImagePresentationProperties setScalingMode:](v6, "setScalingMode:", 3);
  mediaOverlayIcon = self->_mediaOverlayIcon;
  objc_msgSend(v10, "mediaBottomCaptionBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTrailingIcon:", mediaOverlayIcon);

  objc_msgSend(v10, "mediaBottomCaptionBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTrailingIconProperties:", v6);

}

- (unint64_t)_rowConfigurationForStyle:(int64_t)a3
{
  return rowConfigurationForSizeClass(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass", a3));
}

- (BOOL)_prefersIconAsImage
{
  return sizeClassRequiresLargeMedia(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass"));
}

- (BOOL)_prefersImageAsIconWithStyle:(int64_t)a3
{
  if (sizeClassRequiresLargeMedia(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass")))
    return 0;
  if ((sizeClassPrefersIcon(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass")) & 1) != 0)
    return 1;
  return stylePrefersImageAsIcon(a3);
}

- (BOOL)_prefersLeadingIconWithStyle:(int64_t)a3
{
  if (sizeClassRequiresTrailingIcon(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass")))
    return 0;
  if ((stylePrefersLeadingIcon(a3) & 1) != 0)
    return 1;
  return sizeClassPrefersLeadingIcon(-[LPLinkMetadataPresentationTransformer effectiveSizeClass](self, "effectiveSizeClass"));
}

- (void)_populateProperties:(id)a3 withPrimaryImage:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[LPLinkMetadataPresentationTransformer _prefersImageAsIconWithStyle:](self, "_prefersImageAsIconWithStyle:", objc_msgSend(v8, "style")))
  {
    if (-[LPLinkMetadataPresentationTransformer _prefersLeadingIconWithStyle:](self, "_prefersLeadingIconWithStyle:", objc_msgSend(v8, "style")))
    {
      objc_msgSend(v8, "captionBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLeadingIcon:", v6);
    }
    else
    {
      objc_msgSend(v8, "captionBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTrailingIcon:", v6);
    }

  }
  else
  {
    objc_msgSend(v8, "setImage:", v6);
  }

}

- (void)_populateProperties:(id)a3 withPrimaryIcon:(id)a4
{
  -[LPLinkMetadataPresentationTransformer _populateProperties:withPrimaryIcon:iconProperties:](self, "_populateProperties:withPrimaryIcon:iconProperties:", a3, a4, 0);
}

- (void)_populateProperties:(id)a3 withPrimaryIcon:(id)a4 iconProperties:(id)a5 canBecomeImage:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a6;
  v15 = a3;
  v10 = a4;
  v11 = a5;
  if (-[LPLinkMetadataPresentationTransformer _prefersIconAsImage](self, "_prefersIconAsImage") && v6)
  {
    objc_msgSend(v15, "setImage:", v10);
    objc_msgSend(v15, "setImageProperties:", v11);
  }
  else
  {
    if (-[LPLinkMetadataPresentationTransformer _prefersLeadingIconWithStyle:](self, "_prefersLeadingIconWithStyle:", objc_msgSend(v15, "style")))
    {
      objc_msgSend(v15, "captionBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLeadingIcon:", v10);

      objc_msgSend(v15, "setImageProperties:", v11);
      objc_msgSend(v15, "captionBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLeadingIconProperties:", v11);
    }
    else
    {
      objc_msgSend(v15, "captionBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTrailingIcon:", v10);

      objc_msgSend(v15, "setImageProperties:", v11);
      objc_msgSend(v15, "captionBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTrailingIconProperties:", v11);
    }

  }
}

- (void)_populateProperties:(id)a3 withPrimaryIcon:(id)a4 iconProperties:(id)a5
{
  -[LPLinkMetadataPresentationTransformer _populateProperties:withPrimaryIcon:iconProperties:canBecomeImage:](self, "_populateProperties:withPrimaryIcon:iconProperties:canBecomeImage:", a3, a4, a5, 1);
}

- (void)setPreferredSizeClass:(unint64_t)a3
{
  if (a3 == 9)
  {
    self->_preferredSizeClass = 0;
    if (-[LPLinkMetadataPresentationTransformer hasMedia](self, "hasMedia"))
      a3 = 9;
    else
      a3 = 8;
  }
  self->_preferredSizeClass = a3;
}

- (unint64_t)effectiveSizeClass
{
  return self->_preferredSizeClass;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (BOOL)allowsTapToLoad
{
  return self->_allowsTapToLoad;
}

- (void)setAllowsTapToLoad:(BOOL)a3
{
  self->_allowsTapToLoad = a3;
}

- (BOOL)allowsTapping
{
  return self->_allowsTapping;
}

- (void)setAllowsTapping:(BOOL)a3
{
  self->_allowsTapping = a3;
}

- (BOOL)allowsPlaybackControls
{
  return self->_allowsPlaybackControls;
}

- (void)setAllowsPlaybackControls:(BOOL)a3
{
  self->_allowsPlaybackControls = a3;
}

- (BOOL)allowsPlayback
{
  return self->_allowsPlayback;
}

- (void)setAllowsPlayback:(BOOL)a3
{
  self->_allowsPlayback = a3;
}

- (BOOL)hasOverriddenBackgroundColor
{
  return self->_hasOverriddenBackgroundColor;
}

- (void)setHasOverriddenBackgroundColor:(BOOL)a3
{
  self->_hasOverriddenBackgroundColor = a3;
}

- (unint64_t)preferredSizeClass
{
  return self->_preferredSizeClass;
}

- (LPLinkRendererSizeClassParameters)sizeClassParameters
{
  return self->_sizeClassParameters;
}

- (void)setSizeClassParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (LPImage)sourceContextIcon
{
  return self->_sourceContextIcon;
}

- (void)setSourceContextIcon:(id)a3
{
  objc_storeStrong((id *)&self->_sourceContextIcon, a3);
}

- (LPImage)mediaOverlayIcon
{
  return self->_mediaOverlayIcon;
}

- (void)setMediaOverlayIcon:(id)a3
{
  objc_storeStrong((id *)&self->_mediaOverlayIcon, a3);
}

- (UITraitCollection)effectiveAppearance
{
  return self->_effectiveAppearance;
}

- (void)setEffectiveAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveAppearance, a3);
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isCollaborative
{
  return self->_collaborative;
}

- (void)setCollaborative:(BOOL)a3
{
  self->_collaborative = a3;
}

- (BOOL)isInComposeContext
{
  return self->_inComposeContext;
}

- (void)setInComposeContext:(BOOL)a3
{
  self->_inComposeContext = a3;
}

- (unint64_t)bytesLoaded
{
  return self->_bytesLoaded;
}

- (void)setBytesLoaded:(unint64_t)a3
{
  self->_bytesLoaded = a3;
}

- (int64_t)sharedObjectDownloadState
{
  return self->_sharedObjectDownloadState;
}

- (void)setSharedObjectDownloadState:(int64_t)a3
{
  self->_sharedObjectDownloadState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_effectiveAppearance, 0);
  objc_storeStrong((id *)&self->_mediaOverlayIcon, 0);
  objc_storeStrong((id *)&self->_sourceContextIcon, 0);
  objc_storeStrong((id *)&self->_sizeClassParameters, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)presentationProperties
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_5(&dword_1A0C41000, v0, v1, "Failed to generate presentation properties for LPLinkMetadata specialization class %@ with exception: %@");
}

@end
