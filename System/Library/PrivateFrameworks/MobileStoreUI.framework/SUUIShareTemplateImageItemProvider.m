@implementation SUUIShareTemplateImageItemProvider

- (SUUIShareTemplateImageItemProvider)initWithTemplateElement:(id)a3
{
  id v5;
  id v6;
  SUUIShareTemplateImageItemProvider *v7;
  SUUIShareTemplateImageItemProvider *v8;
  objc_super v10;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BEBD640]);
  v10.receiver = self;
  v10.super_class = (Class)SUUIShareTemplateImageItemProvider;
  v7 = -[UIActivityItemProvider initWithPlaceholderItem:](&v10, sel_initWithPlaceholderItem_, v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_templateElement, a3);

  return v8;
}

- (id)item
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SUUIStyledImageDataConsumer *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  -[UIActivityItemProvider activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDF67D8], "activityTypeShouldProvideImage:", v3))
  {
    -[SUUIShareTemplateViewElement activityForUIActivityType:](self->_templateElement, "activityForUIActivityType:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURL:", v6);
      objc_msgSend(v7, "setITunesStoreRequest:", 0);
      v8 = -[SUUIStyledImageDataConsumer initWithViewElement:]([SUUIStyledImageDataConsumer alloc], "initWithViewElement:", v5);
      -[SUUIStyledImageDataConsumer setImageSize:](v8, "setImageSize:", 100.0, 100.0);
      objc_msgSend(v7, "setDataConsumer:", v8);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __42__SUUIShareTemplateImageItemProvider_item__block_invoke;
      v11[3] = &unk_2511F5178;
      v11[4] = &v12;
      objc_msgSend(v7, "setOutputBlock:", v11);
      objc_msgSend(v7, "main");

    }
  }
  v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __42__SUUIShareTemplateImageItemProvider_item__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
}

@end
