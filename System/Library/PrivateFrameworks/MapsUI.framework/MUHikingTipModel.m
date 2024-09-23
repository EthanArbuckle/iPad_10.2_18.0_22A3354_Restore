@implementation MUHikingTipModel

- (MUHikingTipModel)initWithHikingTipViewModel:(id)a3
{
  id v4;
  MUHikingTipModel *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSString *subtitle;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MUHikingTipModel;
  v5 = -[MUHikingTipModel init](&v13, sel_init);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
