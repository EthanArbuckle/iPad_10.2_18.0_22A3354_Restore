@implementation NUArticleActivity

- (NUArticleActivity)initWithActivityType:(id)a3 title:(id)a4 image:(id)a5 performBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NUArticleActivity *v15;
  NUArticleActivity *v16;
  uint64_t v17;
  id performBlock;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)NUArticleActivity;
  v15 = -[UIActivity init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_activityType, a3);
    objc_storeStrong((id *)&v16->_activityTitle, a4);
    objc_storeStrong((id *)&v16->_activityImage, a5);
    v17 = MEMORY[0x2199FC190](v14);
    performBlock = v16->_performBlock;
    v16->_performBlock = (id)v17;

  }
  return v16;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  objc_storeStrong((id *)&self->_activityItems, a3);
}

- (void)performActivity
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;

  -[NUArticleActivity performBlock](self, "performBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NUArticleActivity performBlock](self, "performBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[NUArticleActivity activityItems](self, "activityItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v5);

  }
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (id)activityType
{
  return self->_activityType;
}

- (id)activityTitle
{
  return self->_activityTitle;
}

- (id)activityImage
{
  return self->_activityImage;
}

- (id)performBlock
{
  return self->_performBlock;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setActivityItems:(id)a3
{
  objc_storeStrong((id *)&self->_activityItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_storeStrong(&self->_performBlock, 0);
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
