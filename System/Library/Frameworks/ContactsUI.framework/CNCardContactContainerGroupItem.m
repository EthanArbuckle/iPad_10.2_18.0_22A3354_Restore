@implementation CNCardContactContainerGroupItem

- (CNCardContactContainerGroupItem)initWithContainers:(id)a3
{
  id v5;
  CNCardContactContainerGroupItem *v6;
  CNCardContactContainerGroupItem *v7;
  CNCardContactContainerGroupItem *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNCardContactContainerGroupItem;
  v6 = -[CNCardContactContainerGroupItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containers, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
  objc_storeStrong((id *)&self->_containers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
}

@end
