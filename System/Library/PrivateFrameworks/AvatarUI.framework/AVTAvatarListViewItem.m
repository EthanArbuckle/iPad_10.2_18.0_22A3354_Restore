@implementation AVTAvatarListViewItem

- (AVTAvatarListViewItem)initWithView:(id)a3
{
  id v5;
  AVTAvatarListViewItem *v6;
  AVTAvatarListViewItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarListViewItem;
  v6 = -[AVTAvatarListViewItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_view, a3);

  return v7;
}

- (void)downcastWithRecordHandler:(id)a3 viewHandler:(id)a4
{
  -[AVTAvatarListViewItem downcastWithRecordHandler:imageHandler:viewHandler:](self, "downcastWithRecordHandler:imageHandler:viewHandler:", a3, 0, a4);
}

- (void)downcastWithRecordHandler:(id)a3 imageHandler:(id)a4 viewHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, AVTAvatarListViewItem *))a5 + 2))(a5, self);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v4);
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarListViewItem view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

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

  -[AVTAvatarListViewItem view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (UIView)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
