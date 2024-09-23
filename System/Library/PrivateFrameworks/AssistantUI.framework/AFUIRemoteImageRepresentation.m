@implementation AFUIRemoteImageRepresentation

- (AFUIRemoteImageRepresentation)initWithImageURL:(id)a3
{
  id v4;
  AFUIRemoteImageRepresentation *v5;
  uint64_t v6;
  NSURL *imageURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFUIRemoteImageRepresentation;
  v5 = -[AFUIRemoteImageRepresentation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v6;

    -[AFUIRemoteImageRepresentation _commonInit](v5, "_commonInit");
  }

  return v5;
}

- (void)_commonInit
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *queue;

  v3 = (OS_dispatch_queue *)dispatch_queue_create("ImageItemProvider Downloader", 0);
  queue = self->_queue;
  self->_queue = v3;

}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDC17A8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __93__AFUIRemoteImageRepresentation_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v9[3] = &unk_24D7A1CC8;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, v9);

  return 0;
}

void __93__AFUIRemoteImageRepresentation_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v2, 0, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __93__AFUIRemoteImageRepresentation_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_2;
  v8[3] = &unk_24D7A1CA0;
  v5 = *(id *)(a1 + 40);
  v10 = v4;
  v11 = v5;
  v9 = v3;
  v6 = v4;
  v7 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __93__AFUIRemoteImageRepresentation_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
