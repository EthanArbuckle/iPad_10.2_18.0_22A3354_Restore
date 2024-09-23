@implementation CNCardContactContainerGroup

- (id)displayItems
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)editingItems
{
  CNCardContactContainerGroupItem *v3;
  void *v4;
  CNCardContactContainerGroupItem *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = [CNCardContactContainerGroupItem alloc];
  -[CNCardContactContainerGroup containers](self, "containers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNCardContactContainerGroupItem initWithContainers:](v3, "initWithContainers:", v4);

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
