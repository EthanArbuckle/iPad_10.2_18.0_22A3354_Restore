@implementation INDefaultCardTemplate

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[INDefaultCardTemplate title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTitle:", v5);

  -[INDefaultCardTemplate subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSubtitle:", v7);

  -[INDefaultCardTemplate image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v8);

  return v6;
}

- (void)setImage:(INImage *)image
{
  objc_setProperty_nonatomic_copy(self, a2, image, 24);
}

- (INDefaultCardTemplate)initWithTitle:(NSString *)title
{
  NSString *v4;
  INDefaultCardTemplate *v5;
  uint64_t v6;
  NSString *v7;
  INDefaultCardTemplate *v8;
  objc_super v10;

  v4 = title;
  v10.receiver = self;
  v10.super_class = (Class)INDefaultCardTemplate;
  v5 = -[INDefaultCardTemplate init](&v10, sel_init);
  if (v5)
  {
    v6 = -[NSString copy](v4, "copy");
    v7 = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(NSString *)subtitle
{
  objc_setProperty_nonatomic_copy(self, a2, subtitle, 16);
}

- (INImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  INImageProxyInjectionOperation *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)-[INDefaultCardTemplate copy](self, "copy");
    v9 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    INImageProxyInjectionQueue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnderlyingQueue:", v10);

    objc_msgSend(v9, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(v9, "setSuspended:", 1);
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __83__INDefaultCardTemplate_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
    v17[3] = &unk_1E2293BE8;
    v17[4] = v8;
    v18 = v7;
    objc_msgSend(v11, "blockOperationWithBlock:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[INDefaultCardTemplate image](self, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = objc_alloc_init(INImageProxyInjectionOperation);
      -[INImageProxyInjectionOperation setInjector:](v15, "setInjector:", v14);
      -[INImageProxyInjectionOperation setImageProxyRequestBlock:](v15, "setImageProxyRequestBlock:", v6);
      v16[0] = v12;
      v16[1] = 3221225472;
      v16[2] = __83__INDefaultCardTemplate_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
      v16[3] = &unk_1E22924C0;
      v16[4] = v8;
      -[INImageProxyInjectionOperation setCopyReturnBlock:](v15, "setCopyReturnBlock:", v16);
      objc_msgSend(v13, "addDependency:", v15);
      objc_msgSend(v9, "addOperation:", v15);

    }
    objc_msgSend(v9, "addOperation:", v13);
    objc_msgSend(v9, "setSuspended:", 0);

  }
}

uint64_t __83__INDefaultCardTemplate_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __83__INDefaultCardTemplate_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setImage:", a2);
  return result;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_subtitle, "hash") ^ v3;
  return v4 ^ -[INImage hash](self->_image, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INDefaultCardTemplate *v4;
  INDefaultCardTemplate *v5;
  NSString *title;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  char v11;
  NSString *subtitle;
  uint64_t v13;
  void *v14;
  NSString *v15;
  void *v16;
  INImage *image;
  uint64_t v18;
  INImage *v19;
  INImage *v20;
  void *v21;

  v4 = (INDefaultCardTemplate *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      title = self->_title;
      -[INDefaultCardTemplate title](v5, "title");
      v7 = objc_claimAutoreleasedReturnValue();
      if (title == (NSString *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        v9 = self->_title;
        -[INDefaultCardTemplate title](v5, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

        if (!(_DWORD)v9)
          goto LABEL_11;
      }
      subtitle = self->_subtitle;
      -[INDefaultCardTemplate subtitle](v5, "subtitle");
      v13 = objc_claimAutoreleasedReturnValue();
      if (subtitle == (NSString *)v13)
      {

      }
      else
      {
        v14 = (void *)v13;
        v15 = self->_subtitle;
        -[INDefaultCardTemplate subtitle](v5, "subtitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = -[NSString isEqualToString:](v15, "isEqualToString:", v16);

        if (!(_DWORD)v15)
        {
LABEL_11:
          v11 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      image = self->_image;
      -[INDefaultCardTemplate image](v5, "image");
      v18 = objc_claimAutoreleasedReturnValue();
      if (image == (INImage *)v18)
      {
        v11 = 1;
      }
      else
      {
        v19 = (INImage *)v18;
        v20 = self->_image;
        -[INDefaultCardTemplate image](v5, "image");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[INImage isEqual:](v20, "isEqual:", v21);

        image = v19;
      }

      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (INDefaultCardTemplate)initWithCoder:(id)a3
{
  id v4;
  INDefaultCardTemplate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *title;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *subtitle;
  uint64_t v16;
  INImage *image;
  INDefaultCardTemplate *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)INDefaultCardTemplate;
  v5 = -[INDefaultCardTemplate init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("title"));
    v9 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("subtitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v16 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (INImage *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_image, CFSTR("image"));

}

- (void)setTitle:(NSString *)title
{
  objc_setProperty_nonatomic_copy(self, a2, title, 8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

@end
