@implementation MPCSharedListeningQueueEventContentReplaced

- (MPCSharedListeningQueueEventContentReplaced)initWithStartItem:(id)a3
{
  id v5;
  MPCSharedListeningQueueEventContentReplaced *v6;
  MPCSharedListeningQueueEventContentReplaced *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCSharedListeningQueueEventContentReplaced;
  v6 = -[MPCSharedListeningQueueEventContentReplaced init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_startItem, a3);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEventContentReplaced: %p startItem=%@>"), self, self->_startItem);
}

- (MPModelGenericObject)startItem
{
  return self->_startItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startItem, 0);
}

@end
