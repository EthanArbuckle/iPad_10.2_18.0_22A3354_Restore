@implementation AAAppleTVRequest

- (AAAppleTVRequest)initWithAccount:(id)a3
{
  id v5;
  AAAppleTVRequest *v6;
  AAAppleTVRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAAppleTVRequest;
  v6 = -[AAAppleTVRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
