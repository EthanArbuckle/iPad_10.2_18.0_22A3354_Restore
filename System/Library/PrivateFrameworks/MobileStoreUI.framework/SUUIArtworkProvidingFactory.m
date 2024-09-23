@implementation SUUIArtworkProvidingFactory

+ (id)artworkProviderForStoreResponse:(id)a3
{
  id v3;
  SUUIArtworkList *v4;
  SUUIArtworkList *v5;

  v3 = a3;
  if (+[SUUIArtworkList canHandleArtworkFormat:](SUUIArtworkList, "canHandleArtworkFormat:", v3))
  {
    v4 = -[SUUIArtworkList initWithArtworkListArray:]([SUUIArtworkList alloc], "initWithArtworkListArray:", v3);
  }
  else
  {
    if (!+[SUUIArtworkTemplate canHandleArtworkFormat:](SUUIArtworkTemplate, "canHandleArtworkFormat:", v3))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = -[SUUIArtworkTemplate initWithTemplateDictionary:]([SUUIArtworkTemplate alloc], "initWithTemplateDictionary:", v3);
  }
  v5 = v4;
LABEL_7:

  return v5;
}

+ (id)artworkCacheCandidatesForProvider:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "artworks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "servedArtworks");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allObjects");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

@end
