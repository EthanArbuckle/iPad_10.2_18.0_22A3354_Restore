@implementation TKNetworkDefaultTask

- (TKNetworkDefaultTask)initWithTask:(id)a3
{
  TKNetworkDefaultTask *v3;
  TKNetworkDefaultTask *v5;
  objc_super v6;
  id location[2];
  TKNetworkDefaultTask *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)TKNetworkDefaultTask;
  v8 = -[TKNetworkDefaultTask init](&v6, sel_init);
  objc_storeStrong((id *)&v8, v8);
  if (v8)
    objc_storeStrong((id *)&v8->_task, location[0]);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (void)cancel
{
  id v2;

  if (self->_task)
  {
    v2 = +[MCLURLDataLoader shared](MCLURLDataLoader, "shared");
    objc_msgSend(v2, "cancelTask:", self->_task);

    objc_storeStrong((id *)&self->_task, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
}

@end
