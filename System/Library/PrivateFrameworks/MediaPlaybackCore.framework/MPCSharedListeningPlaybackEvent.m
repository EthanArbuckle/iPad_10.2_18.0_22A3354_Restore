@implementation MPCSharedListeningPlaybackEvent

- (MPCSharedListeningPlaybackEvent)initWithKind:(int64_t)a3
{
  return -[MPCSharedListeningPlaybackEvent initWithKind:item:](self, "initWithKind:item:", a3, 0);
}

- (MPCSharedListeningPlaybackEvent)initWithKind:(int64_t)a3 item:(id)a4
{
  id v7;
  MPCSharedListeningPlaybackEvent *v8;
  MPCSharedListeningPlaybackEvent *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MPCSharedListeningPlaybackEvent;
  v8 = -[MPCSharedListeningPlaybackEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_kind = a3;
    objc_storeStrong((id *)&v8->_item, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  unint64_t kind;
  __CFString *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  kind = self->_kind;
  if (kind >= 5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/kind=%ld"), self->_kind);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24CAB5BC8[kind];
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MPCSharedListeningPlaybackEvent: %p kind=%@>"), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)kind
{
  return self->_kind;
}

- (MPModelGenericObject)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
