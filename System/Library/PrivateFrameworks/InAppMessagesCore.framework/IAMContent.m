@implementation IAMContent

- (IAMContent)initWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 images:(id)a6 actions:(id)a7 contentParameters:(id)a8 identifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  IAMContent *v21;
  uint64_t v22;
  NSString *title;
  uint64_t v24;
  NSString *subtitle;
  uint64_t v26;
  NSString *body;
  uint64_t v28;
  NSArray *images;
  uint64_t v30;
  NSArray *actions;
  objc_super v33;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v33.receiver = self;
  v33.super_class = (Class)IAMContent;
  v21 = -[IAMContent init](&v33, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    title = v21->_title;
    v21->_title = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    subtitle = v21->_subtitle;
    v21->_subtitle = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    body = v21->_body;
    v21->_body = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    images = v21->_images;
    v21->_images = (NSArray *)v28;

    v30 = objc_msgSend(v19, "copy");
    actions = v21->_actions;
    v21->_actions = (NSArray *)v30;

    objc_storeStrong((id *)&v21->_contentParameters, a8);
  }

  return v21;
}

- (IAMContent)initWithICMessageContent:(id)a3
{
  id v4;
  IAMContent *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSString *subtitle;
  void *v12;
  uint64_t v13;
  NSString *body;
  void *v15;
  uint64_t v16;
  NSArray *images;
  void *v18;
  uint64_t v19;
  NSArray *actions;
  void *v21;
  uint64_t v22;
  NSDictionary *contentParameters;
  void *v24;
  uint64_t v25;
  NSString *identifier;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)IAMContent;
  v5 = -[IAMContent init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v7;

    objc_msgSend(v4, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    objc_msgSend(v4, "body");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    body = v5->_body;
    v5->_body = (NSString *)v13;

    objc_msgSend(v4, "images");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "iam_map:", &__block_literal_global_1);
    v16 = objc_claimAutoreleasedReturnValue();
    images = v5->_images;
    v5->_images = (NSArray *)v16;

    objc_msgSend(v4, "messageActions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "iam_map:", &__block_literal_global_2);
    v19 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v19;

    objc_msgSend(v4, "contentParameters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "iam_dictionaryFromArrayOfICIIAMParameters");
    v22 = objc_claimAutoreleasedReturnValue();
    contentParameters = v5->_contentParameters;
    v5->_contentParameters = (NSDictionary *)v22;

    objc_msgSend(v4, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v25;

  }
  return v5;
}

IAMImage *__39__IAMContent_initWithICMessageContent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  IAMImage *v3;

  v2 = a2;
  v3 = -[IAMImage initWithICImage:]([IAMImage alloc], "initWithICImage:", v2);

  return v3;
}

IAMAction *__39__IAMContent_initWithICMessageContent___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  IAMAction *v3;

  v2 = a2;
  v3 = -[IAMAction initWithICAction:]([IAMAction alloc], "initWithICAction:", v2);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTitle:subtitle:body:images:actions:contentParameters:identifier:", self->_title, self->_subtitle, self->_body, self->_images, self->_actions, self->_contentParameters, self->_identifier);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)body
{
  return self->_body;
}

- (NSArray)images
{
  return self->_images;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSDictionary)contentParameters
{
  return self->_contentParameters;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentParameters, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
