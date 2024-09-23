@implementation SUUITemplatedBadgeImageConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUUITemplatedBadgeImageConsumer;
  -[SUUIImageDataConsumer objectForData:response:error:](&v12, sel_objectForData_response_error_, a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    return 0;
  v7 = (void *)v6;
  -[SUUITemplatedBadgeImageConsumer templateColor](self, "templateColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SUUITemplatedBadgeImageConsumer templateColor](self, "templateColor");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_flatImageWithColor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  else
  {
    -[SUUIImageDataConsumer imageForImage:](self, "imageForImage:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (UIColor)templateColor
{
  return self->_templateColor;
}

- (void)setTemplateColor:(id)a3
{
  objc_storeStrong((id *)&self->_templateColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateColor, 0);
}

@end
