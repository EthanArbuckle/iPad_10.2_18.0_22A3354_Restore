@implementation IKSrcSetRule

- (IKSrcSetRule)initWithURL:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  IKSrcSetRule *v8;
  IKSrcSetRule *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IKSrcSetRule;
  v8 = -[IKSrcSetRule init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[IKSrcSetRule setImageURL:](v8, "setImageURL:", v6);
    if (objc_msgSend(v7, "length"))
      -[IKSrcSetRule _parseDescriptor:](v9, "_parseDescriptor:", v7);
  }

  return v9;
}

- (void)_parseDescriptor:(id)a3
{
  id v4;

  v4 = a3;
  -[IKSrcSetRule setDescriptor:](self, "setDescriptor:", v4);
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("("))
    && objc_msgSend(v4, "hasSuffix:", CFSTR(")")))
  {
    -[IKSrcSetRule _parseMediaQueryDescriptor:](self, "_parseMediaQueryDescriptor:", v4);
  }
  else
  {
    -[IKSrcSetRule _parseResolutionDescriptor:](self, "_parseResolutionDescriptor:", v4);
  }

}

- (void)_parseMediaQueryDescriptor:(id)a3
{
  IKCSSTokenizer *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = -[IKCSSTokenizer initWithText:]([IKCSSTokenizer alloc], "initWithText:", v12);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSTokenizer getNextToken](v4, "getNextToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "type") == 2)
  {
    v7 = v6;
  }
  else
  {
    do
    {
      -[IKCSSTokenizer reconsumeToken:](v4, "reconsumeToken:", v6);
      +[IKCSSParser consumeComponentValue:](IKCSSParser, "consumeComponentValue:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

      -[IKCSSTokenizer getNextToken](v4, "getNextToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v7;
    }
    while (objc_msgSend(v7, "type") != 2);
  }
  if (objc_msgSend(v5, "count"))
  {
    +[IKCSSMediaQuery mediaQueryFromTokenList:](IKCSSMediaQuery, "mediaQueryFromTokenList:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKStyleMediaQuery mediaQueryListWithCSSMediaQuery:](IKStyleMediaQuery, "mediaQueryListWithCSSMediaQuery:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKSrcSetRule setMediaQuery:](self, "setMediaQuery:", v11);
  }

}

- (void)_parseResolutionDescriptor:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  IKStyleMediaQuery *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CFSTR("1x");
  v6 = CFSTR("2x");
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("2x")) & 1) != 0
    || (v6 = CFSTR("3x"), objc_msgSend(v4, "isEqualToString:", CFSTR("3x"))))
  {
    v7 = v6;

    v5 = v7;
  }
  v10 = CFSTR("min-pixel-ratio");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IKStyleMediaQuery initWithMediaType:featureValues:isNegated:]([IKStyleMediaQuery alloc], "initWithMediaType:featureValues:isNegated:", CFSTR("all"), v8, 0);
  -[IKSrcSetRule setMediaQuery:](self, "setMediaQuery:", v9);

}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (NSString)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (IKStyleMediaQuery)mediaQuery
{
  return self->_mediaQuery;
}

- (void)setMediaQuery:(id)a3
{
  objc_storeStrong((id *)&self->_mediaQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaQuery, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

@end
