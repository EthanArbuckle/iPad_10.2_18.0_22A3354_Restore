@implementation CKStackedAvatarView

- (CKStackedAvatarView)initWithContacts:(id)a3
{
  id v4;
  CKStackedAvatarView *v5;
  uint64_t v6;
  NSArray *contacts;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[4];
  CKStackedAvatarView *v15;
  uint64_t v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKStackedAvatarView;
  v5 = -[CKStackedAvatarView init](&v17, sel_init);
  if (v5)
  {
    if (initWithContacts__onceToken != -1)
      dispatch_once(&initWithContacts__onceToken, &__block_literal_global_82);
    v6 = objc_msgSend(v4, "copy");
    contacts = v5->_contacts;
    v5->_contacts = (NSArray *)v6;

    v8 = -[NSArray count](v5->_contacts, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v10 = v8;
      do
      {
        objc_msgSend(v9, "addObject:", initWithContacts__silhouetteMonogram);
        --v10;
      }
      while (v10);
    }
    -[CKStackedAvatarView _stackWithMonograms:](v5, "_stackWithMonograms:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKStackedAvatarView setImage:](v5, "setImage:", v11);

    v12 = initWithContacts__monogramRenderingQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__CKStackedAvatarView_initWithContacts___block_invoke_2;
    v14[3] = &unk_1E274C9C0;
    v16 = v8;
    v15 = v5;
    dispatch_async(v12, v14);

  }
  return v5;
}

void __40__CKStackedAvatarView_initWithContacts___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97518]), "initWithStyle:diameter:", 0, 30.0);
  v1 = (void *)initWithContacts__monogrammer;
  initWithContacts__monogrammer = v0;

  objc_msgSend((id)initWithContacts__monogrammer, "silhouetteMonogram");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithContacts__silhouetteMonogram;
  initWithContacts__silhouetteMonogram = v2;

  v4 = dispatch_queue_create("CKStackedAvatarView", 0);
  v5 = (void *)initWithContacts__monogramRenderingQueue;
  initWithContacts__monogramRenderingQueue = (uint64_t)v4;

}

void __40__CKStackedAvatarView_initWithContacts___block_invoke_2(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = 0;
    do
    {
      v4 = (void *)initWithContacts__monogrammer;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "monogramForContact:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v6);

      ++v3;
    }
    while (v3 < *(_QWORD *)(a1 + 40));
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__CKStackedAvatarView_initWithContacts___block_invoke_3;
  v8[3] = &unk_1E274A108;
  v9 = *(id *)(a1 + 32);
  v10 = v2;
  v7 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __40__CKStackedAvatarView_initWithContacts___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__CKStackedAvatarView_initWithContacts___block_invoke_4;
  v4[3] = &unk_1E274A108;
  v5 = v3;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "transitionWithView:duration:options:animations:completion:", v5, 5242880, v4, 0, 0.2);

}

void __40__CKStackedAvatarView_initWithContacts___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_stackWithMonograms:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setImage:", v2);

}

- (id)_stackWithMonograms:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  CGContext *CurrentContext;
  void *v9;
  uint64_t v10;
  _QWORD v12[6];
  BOOL v13;
  CGSize v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 == 1)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
    v14.height = 30.0;
    v14.width = (double)(unint64_t)(v5 - 1) * 8.0 + 30.0;
    UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "set");

    v10 = objc_msgSend(MEMORY[0x1E0CEABB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[CKStackedAvatarView semanticContentAttribute](self, "semanticContentAttribute"));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__CKStackedAvatarView__stackWithMonograms___block_invoke;
    v12[3] = &__block_descriptor_49_e24_v32__0__UIImage_8Q16_B24l;
    v13 = v10 == 0;
    v12[4] = v7;
    v12[5] = CurrentContext;
    objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v12);
    UIGraphicsGetImageFromCurrentImageContext();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v6;
}

void __43__CKStackedAvatarView__stackWithMonograms___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  CGFloat v4;
  id v5;
  CGRect v6;
  CGRect v7;

  if (!*(_BYTE *)(a1 + 48))
    a3 = *(_QWORD *)(a1 + 32) + ~a3;
  v4 = (double)a3 * 8.0;
  v5 = a2;
  v6.origin.y = 0.0;
  v6.size.width = 30.0;
  v6.size.height = 30.0;
  v6.origin.x = v4;
  v7 = CGRectInset(v6, -1.5, -1.5);
  CGContextFillEllipseInRect(*(CGContextRef *)(a1 + 40), v7);
  objc_msgSend(v5, "drawAtPoint:", v4, 0.0);

}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contacts, 0);
}

@end
