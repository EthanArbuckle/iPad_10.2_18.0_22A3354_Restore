@implementation AVTAvatarListImageItem

- (AVTAvatarListImageItem)initWithImage:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  AVTAvatarListImageItem *v9;
  AVTAvatarListImageItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarListImageItem;
  v9 = -[AVTAvatarListImageItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_image, a3);
    objc_storeStrong((id *)&v10->_title, a4);
  }

  return v10;
}

- (void)downcastWithRecordHandler:(id)a3 viewHandler:(id)a4
{
  -[AVTAvatarListImageItem downcastWithRecordHandler:imageHandler:viewHandler:](self, "downcastWithRecordHandler:imageHandler:viewHandler:", a3, 0, a4);
}

- (void)downcastWithRecordHandler:(id)a3 imageHandler:(id)a4 viewHandler:(id)a5
{
  if (a4)
    (*((void (**)(id, AVTAvatarListImageItem *))a4 + 2))(a4, self);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v5);
    v6 = v5;
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[AVTAvatarListImageItem image](self, "image"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarListImageItem image](self, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v7)
      {

        if (v10)
          goto LABEL_8;
      }
      else
      {

        if ((v10 & 1) != 0)
          goto LABEL_8;
      }
      v14 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_8:
    objc_msgSend(v6, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      || (-[AVTAvatarListImageItem title](self, "title"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarListImageItem title](self, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v11)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      v14 = 1;
    }

    goto LABEL_17;
  }
  v14 = 0;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  void *v7;
  unint64_t v8;

  -[AVTAvatarListImageItem image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AVTAvatarListImageItem image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v6 + 1) = v4;
  *(_QWORD *)&v6 = objc_msgSend(v5, "hash");
  -[AVTAvatarListImageItem title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ (v6 >> 32);

  return v8;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
