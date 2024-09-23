@implementation SUUIBadgeTextAttachmentLoader

- (SUUIBadgeTextAttachmentLoader)initWithResourceLoader:(id)a3
{
  id v5;
  SUUIBadgeTextAttachmentLoader *v6;
  SUUIBadgeTextAttachmentLoader *v7;
  uint64_t v8;
  NSMapTable *imageRequests;
  uint64_t v10;
  NSHashTable *stringViews;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIBadgeTextAttachmentLoader;
  v6 = -[SUUIBadgeTextAttachmentLoader init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resourceLoader, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    imageRequests = v7->_imageRequests;
    v7->_imageRequests = (NSMapTable *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 0);
    stringViews = v7->_stringViews;
    v7->_stringViews = (NSHashTable *)v10;

  }
  return v7;
}

- (void)connectStringView:(id)a3
{
  NSHashTable *stringViews;
  id v4;

  stringViews = self->_stringViews;
  v4 = a3;
  -[NSHashTable addObject:](stringViews, "addObject:", v4);

}

- (void)disconnectStringView:(id)a3
{
  -[NSHashTable removeObject:](self->_stringViews, "removeObject:", a3);
}

- (BOOL)loadImageForBadge:(id)a3 layout:(id)a4 reason:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD *p_isa;
  SUUIArtworkRequest *v14;
  void *v15;
  SUUIBadgeImageRequest *v16;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "imageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_msgSend(v8, "image"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    -[NSMapTable objectForKey:](self->_imageRequests, "objectForKey:", v8);
    p_isa = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (p_isa
      && -[SUUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_resourceLoader, "trySetReason:forRequestWithIdentifier:", a5, p_isa[1]))
    {
      v12 = 0;
    }
    else
    {
      v14 = objc_alloc_init(SUUIArtworkRequest);
      +[SSVURLDataConsumer consumer](SUUIImageDataConsumer, "consumer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIArtworkRequest setDataConsumer:](v14, "setDataConsumer:", v15);

      -[SUUIArtworkRequest setDelegate:](v14, "setDelegate:", self);
      -[SUUIArtworkRequest setURL:](v14, "setURL:", v10);
      v16 = objc_alloc_init(SUUIBadgeImageRequest);

      v16->_requestIdentifier = -[SUUIResourceRequest requestIdentifier](v14, "requestIdentifier");
      objc_storeStrong((id *)&v16->_stringLayout, a4);
      -[NSMapTable setObject:forKey:](self->_imageRequests, "setObject:forKey:", v16, v8);
      v12 = -[SUUIResourceLoader loadResourceWithRequest:reason:](self->_resourceLoader, "loadResourceWithRequest:reason:", v14, a5);

      p_isa = &v16->super.isa;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  uint64_t v7;
  NSMapTable *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id *v13;
  id *v14;
  id v15;
  NSHashTable *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_msgSend(a3, "requestIdentifier");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = self->_imageRequests;
  v9 = (id)-[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
      -[NSMapTable objectForKey:](self->_imageRequests, "objectForKey:", v12);
      v13 = (id *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((id)v7 == v13[1])
        break;

      if (v9 == (id)++v11)
      {
        v9 = (id)-[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v12;
    v9 = v14[2];

    if (!v15)
      goto LABEL_24;
    objc_msgSend(v15, "setImage:", v6);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = self->_stringViews;
    v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v21, "layout", (_QWORD)v23);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          if (v22 == v9)
          {
            v8 = v21;

            if (v8)
            {
              -[NSMapTable setNeedsDisplay](v8, "setNeedsDisplay");
              -[NSHashTable removeObject:](self->_stringViews, "removeObject:", v8);
            }
            goto LABEL_22;
          }
        }
        v18 = -[NSHashTable countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v18)
          continue;
        break;
      }
    }

    v8 = 0;
LABEL_22:
    -[NSMapTable removeObjectForKey:](self->_imageRequests, "removeObjectForKey:", v15, (_QWORD)v23);
  }
  else
  {
LABEL_9:
    v15 = 0;
  }

LABEL_24:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringViews, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_imageRequests, 0);
}

@end
