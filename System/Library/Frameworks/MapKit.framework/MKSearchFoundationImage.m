@implementation MKSearchFoundationImage

- (id)initIconWithSize:(unint64_t)a3 mapItem:(id)a4
{
  id v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  dispatch_group_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v19[4];
  char *v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  objc_super v24;

  v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)MKSearchFoundationImage;
  v7 = -[MKSearchFoundationImage init](&v24, sel_init);
  if (v7)
  {
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "screenScale");
    v10 = v9;

    objc_msgSend(v7, "setSize:", 60.0, 60.0);
    if (objc_msgSend(v6, "_parsecSectionType") == 2)
    {
      objc_msgSend(v7, "size");
      objc_msgSend(v6, "_bestBrandIconURLForSize:allowSmaller:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      v13 = 112;
    }
    else
    {
      objc_msgSend(v6, "_styleAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      v13 = 120;
    }
    v14 = *(void **)&v7[v13];
    *(_QWORD *)&v7[v13] = v12;

    v15 = dispatch_group_create();
    v16 = (void *)*((_QWORD *)v7 + 13);
    *((_QWORD *)v7 + 13) = v15;

    dispatch_group_enter(*((dispatch_group_t *)v7 + 13));
    dispatch_get_global_queue(25, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __52__MKSearchFoundationImage_initIconWithSize_mapItem___block_invoke;
    v19[3] = &unk_1E20DC7D8;
    v20 = v7;
    v21 = v6;
    v22 = a3;
    v23 = v10;
    dispatch_async(v17, v19);

  }
  return v7;
}

void __52__MKSearchFoundationImage_initIconWithSize_mapItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  UIImage *v4;

  v2 = (void *)MEMORY[0x18D778BE4]();
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112)
    || (objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[MKIconManager imageForMapItem:size:forScale:format:](MKIconManager, "imageForMapItem:size:forScale:format:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 2, *(double *)(a1 + 56));
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "setImageData:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 104));

  objc_autoreleasePoolPop(v2);
}

- (void)loadImageDataWithCompletionAndErrorHandler:(id)a3
{
  id v4;
  NSObject *group;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  group = self->_group;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__MKSearchFoundationImage_loadImageDataWithCompletionAndErrorHandler___block_invoke;
  v7[3] = &unk_1E20D7F70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], v7);

}

void __70__MKSearchFoundationImage_loadImageDataWithCompletionAndErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "imageData");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)loadImageDataWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__MKSearchFoundationImage_loadImageDataWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E20DC800;
  v7 = v4;
  v5 = v4;
  -[MKSearchFoundationImage loadImageDataWithCompletionAndErrorHandler:](self, "loadImageDataWithCompletionAndErrorHandler:", v6);

}

uint64_t __62__MKSearchFoundationImage_loadImageDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *url;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKSearchFoundationImage;
  if (-[MKSearchFoundationImage isEqual:](&v8, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ((url = self->_url) != 0 && v4[14] || (url = self->_styleAttribute) != 0 && v4[15]))
  {
    v6 = objc_msgSend(url, "isEqual:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttribute, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
