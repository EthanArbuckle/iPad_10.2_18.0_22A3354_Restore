@implementation AVTAvatarListRecordItem

- (AVTAvatarListRecordItem)initWithAvatar:(id)a3
{
  id v5;
  AVTAvatarListRecordItem *v6;
  AVTAvatarListRecordItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarListRecordItem;
  v6 = -[AVTAvatarListRecordItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_avatar, a3);

  return v7;
}

- (void)downcastWithRecordHandler:(id)a3 viewHandler:(id)a4
{
  -[AVTAvatarListRecordItem downcastWithRecordHandler:imageHandler:viewHandler:](self, "downcastWithRecordHandler:imageHandler:viewHandler:", a3, 0, a4);
}

- (void)downcastWithRecordHandler:(id)a3 imageHandler:(id)a4 viewHandler:(id)a5
{
  if (a3)
    (*((void (**)(id, AVTAvatarListRecordItem *))a3 + 2))(a3, self);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v4);
    objc_msgSend(v4, "avatar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarListRecordItem avatar](self, "avatar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AVTAvatarListRecordItem avatar](self, "avatar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (AVTAvatarRecord)avatar
{
  return self->_avatar;
}

- (UIImage)cachedImage
{
  return (UIImage *)objc_loadWeakRetained((id *)&self->_cachedImage);
}

- (void)setCachedImage:(id)a3
{
  objc_storeWeak((id *)&self->_cachedImage, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cachedImage);
  objc_storeStrong((id *)&self->_avatar, 0);
}

@end
