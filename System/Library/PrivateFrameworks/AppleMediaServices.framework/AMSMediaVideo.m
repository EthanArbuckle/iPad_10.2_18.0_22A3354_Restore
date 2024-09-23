@implementation AMSMediaVideo

- (AMSMediaVideo)initWithDictionary:(id)a3
{
  id v5;
  AMSMediaVideo *v6;
  AMSMediaVideo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMediaVideo;
  v6 = -[AMSMediaVideo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_videoDictionary, a3);

  return v7;
}

- (id)name
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMediaVideo videoDictionary](self, "videoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (NSURL)URL
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[AMSMediaVideo videoDictionary](self, "videoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("video"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
    goto LABEL_5;
  }
  v4 = v3;

  if (!v4)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (NSURL *)v5;
}

- (NSDictionary)videoDictionary
{
  return self->_videoDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoDictionary, 0);
}

@end
