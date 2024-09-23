@implementation _SFWebClipMetadataFetcher

+ (id)metadataFetcherScriptSource
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  return objc_autoreleaseReturnValue((id)objc_msgSend(v2, "initWithBytesNoCopy:length:encoding:freeWhenDone:", "//# sourceURL=__InjectedScript_WebClipMetadataFetcher.js\n/* Copyright (c) 2024 Apple Inc. All rights reserved. */\n/*\n * Copyright (c) 2014 Apple Inc. All rights reserved.\n */\nconst MetaTagNamesToScrape=[\"apple-mobile-web-app-capable\",\"apple-mobile-web-app-title\",\"viewport\",\"apple-mobile-web-app-status-bar-style\"],LinkRelTypesToScrape=[\"apple-touch-icon\",\"apple-touch-icon-precomposed\",\"apple-touch-startup-image\",\"icon\",\"shortcut icon\"];var Orientation={Portrait:"
                                           "0,Landscape:1},WebClipMetadataFinder=function(){};WebClipMetadataFinder.proto"
                                           "type={webClipMetadata:function(){return{metaTags:this.metaTagsMetadata(),link"
                                           "Tags:this.linkTagsMetadata(),canonicalURLString:this.canonicalURLStringForPag"
                                           "e()}},metaTagsMetadata:function(){function e(e){if (\"apple-mobile-web-app-sta"
                                           "tus-bar-style\"===e.name)e.content.toLowerCase()}for (var t={},a=document.head"
                                           ".getElementsByTagName(\"meta\"),i=a.length,n=0;n<i;++n){var r=a[n],o=r.name;-"
                                           "1!==MetaTagNamesToScrape.indexOf(o)&&(e(r),t[o]=r.content)}return t},currentO"
                                           "rientation:function(){return void 0===this._currentOrientation&&(window.match"
                                           "Media(\"(orientation: portrait)\").matches?this._currentOrientation=Orientati"
                                           "on.Portrait:this._currentOrientation=Orientation.Landscape),this._currentOrie"
                                           "ntation},canonicalURLStringForPage:function(){var e=document.head.querySelect"
                                           "or(\"link[rel='canonical']\");return e?e.href:\"\"},linkTagsMetadata:function"
                                           "(){for (var e=[],t=document.head.getElementsByTagName(\"link\"),a=t.length,i=0"
                                           ";i<a;++i){var n=t[i],r=n.rel;if (-1!==LinkRelTypesToScrape.indexOf(r)){var o=n"
                                           ".href,c=n.getAttribute(\"sizes\");if (o){var s=n.media,p=!0,d=!0;if (s){var u=w"
                                           "indow.matchMedia(s);p=this.mediaQueryListMatchesOrientation(u,Orientation.Por"
                                           "trait),d=this.mediaQueryListMatchesOrientation(u,Orientation.Landscape)}var l"
                                           "={rel:r,href:o,mediaMatchesPortraitOrientation:p,mediaMatchesLandscapeOrienta"
                                           "tion:d};c&&(l.sizes=c),e.push(l)}}}return e},mediaQueryListMatchesOrientation"
                                           ":function(e,t){var a=e.media;if (\"invalid\"===a)return!1;if (t===this.currentO"
                                           "rientation())return e.matches;var i=this.reverseMediaQueryOrientation(a);retu"
                                           "rn window.matchMedia(i).matches},reverseMediaQueryOrientation:function(e){ret"
                                           "urn e.replace(/orientation: (portrait|landscape)/,(function(e,t){return\"orie"
                                           "ntation: \"+(\"portrait\"===t?\"landscape\":\"portrait\")}))}};var WebClipMet"
                                           "adataFinderJS=new WebClipMetadataFinder;",
                                           webClipMetadataFetcherSourceLength,
                                           4,
                                           0));
}

- (_SFWebClipMetadataFetcher)initWithInjectedJavascriptController:(id)a3
{
  id v4;
  _SFWebClipMetadataFetcher *v5;
  _SFWebClipMetadataFetcher *v6;
  uint64_t v7;
  NSMutableArray *metadataConsumers;
  _SFWebClipMetadataFetcher *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFWebClipMetadataFetcher;
  v5 = -[_SFWebClipMetadataFetcher init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_jsController, v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v7 = objc_claimAutoreleasedReturnValue();
    metadataConsumers = v6->_metadataConsumers;
    v6->_metadataConsumers = (NSMutableArray *)v7;

    -[_SFWebClipMetadataFetcher _startFetchingMetadata](v6, "_startFetchingMetadata");
    v9 = v6;
  }

  return v6;
}

- (void)_startFetchingMetadata
{
  id WeakRetained;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_jsController);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51___SFWebClipMetadataFetcher__startFetchingMetadata__block_invoke;
  v4[3] = &unk_1E4AC65E8;
  v4[4] = self;
  objc_msgSend(WeakRetained, "runJavaScriptForActivity:withScript:object:invokeMethod:completionHandler:", CFSTR("WebClipMetadataJS"), 0, CFSTR("WebClipMetadataFinderJS"), CFSTR("webClipMetadata"), v4);

}

+ (id)_webClipLinkTagWithDictionary:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (objc_class *)MEMORY[0x1E0DC3F78];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("href"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHref:", v6);

  objc_msgSend(v4, "safari_stringForKey:", CFSTR("rel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRel:", v7);

  objc_msgSend(v4, "safari_stringForKey:", CFSTR("sizes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSizes:", v8);

  objc_msgSend(v5, "setMediaMatchesPortraitOrientation:", objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("mediaMatchesPortraitOrientation")));
  v9 = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("mediaMatchesLandscapeOrientation"));

  objc_msgSend(v5, "setMediaMatchesLandscapeOrientation:", v9);
  return v5;
}

+ (void)parseRawMetadataDictionary:(id)a3 consumer:(id)a4
{
  id v5;
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "safari_arrayForKey:", CFSTR("linkTags"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend((id)objc_opt_class(), "_webClipLinkTagWithDictionary:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    objc_msgSend(v5, "safari_dictionaryForKey:", CFSTR("metaTags"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v7, "copy");
    v6[2](v6, v14, v15);

  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E0C9AA70], (void *)MEMORY[0x1E0C9AA60]);
  }

}

- (void)fetchMetadataWithConsumer:(id)a3
{
  NSMutableArray *metadataConsumers;
  id v4;

  if (self->_fetchingCompleted)
  {
    (*((void (**)(id, NSDictionary *, NSArray *))a3 + 2))(a3, self->_metaTags, self->_linkTags);
  }
  else
  {
    metadataConsumers = self->_metadataConsumers;
    v4 = (id)MEMORY[0x1A8598C40](a3, a2);
    -[NSMutableArray addObject:](metadataConsumers, "addObject:", v4);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_jsController);
  objc_storeStrong((id *)&self->_metadataConsumers, 0);
  objc_storeStrong((id *)&self->_linkTags, 0);
  objc_storeStrong((id *)&self->_metaTags, 0);
}

@end
