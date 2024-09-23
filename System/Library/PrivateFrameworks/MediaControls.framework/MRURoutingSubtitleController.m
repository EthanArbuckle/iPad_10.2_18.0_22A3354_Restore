@implementation MRURoutingSubtitleController

- (MRURoutingSubtitleController)init
{
  MRURoutingSubtitleController *v2;
  MRURoutingSubtitleController *v3;
  uint64_t v4;
  NSMutableDictionary *storage;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRURoutingSubtitleController;
  v2 = -[MRURoutingSubtitleController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    storage = v3->_storage;
    v3->_storage = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRURoutingSubtitleController storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p storage=%@ >"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasText
{
  return -[NSMutableDictionary count](self->_storage, "count") != 0;
}

- (NSString)text
{
  NSMutableDictionary *storage;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  storage = self->_storage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](storage, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return (NSString *)v6;
}

- (UIImage)icon
{
  NSMutableDictionary *storage;
  void *v3;
  void *v4;
  void *v5;

  storage = self->_storage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](storage, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v5;
}

- (int64_t)accessory
{
  NSMutableDictionary *storage;
  void *v3;
  void *v4;
  int64_t v5;

  storage = self->_storage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](storage, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessory");

  return v5;
}

- (BOOL)canTransitionToNextState
{
  return -[MRURoutingSubtitleController nextAvailableTextState](self, "nextAvailableTextState") != self->_state;
}

- (void)prepareForReuse
{
  self->_state = 0;
  -[NSMutableDictionary removeAllObjects](self->_storage, "removeAllObjects");
}

- (void)transitionToNextAvailableState
{
  self->_state = -[MRURoutingSubtitleController nextAvailableTextState](self, "nextAvailableTextState");
}

- (void)setText:(id)a3 forState:(int64_t)a4
{
  -[MRURoutingSubtitleController setText:forState:accessory:](self, "setText:forState:accessory:", a3, a4, 0);
}

- (void)setText:(id)a3 icon:(id)a4 forState:(int64_t)a5
{
  -[MRURoutingSubtitleController setText:icon:forState:accessory:](self, "setText:icon:forState:accessory:", a3, a4, a5, 3);
}

- (void)setText:(id)a3 forState:(int64_t)a4 accessory:(int64_t)a5
{
  -[MRURoutingSubtitleController setText:icon:forState:accessory:](self, "setText:icon:forState:accessory:", a3, 0, a4, a5);
}

- (void)setText:(id)a3 icon:(id)a4 forState:(int64_t)a5 accessory:(int64_t)a6
{
  id v10;
  NSMutableDictionary *storage;
  void *v12;
  void *v13;
  MRUSubtitleValue *v14;
  NSMutableDictionary *v15;
  void *v16;
  NSMutableDictionary *v17;
  int64_t state;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v10 = a4;
  storage = self->_storage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](storage, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "length"))
  {
    v14 = -[MRUSubtitleValue initWithText:icon:accessory:]([MRUSubtitleValue alloc], "initWithText:icon:accessory:", v21, v10, a6);
    v15 = self->_storage;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v14, v16);
  }
  else
  {
    v17 = self->_storage;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v17, "removeObjectForKey:", v16);
    v14 = 0;
  }

  if (!self->_state && -[MRURoutingSubtitleController hasText](self, "hasText"))
    -[MRURoutingSubtitleController transitionToNextAvailableState](self, "transitionToNextAvailableState");
  state = self->_state;
  if (state && state == a5 && (objc_msgSend(v13, "isEqualToSubtitleValue:", v14) & 1) == 0)
  {
    -[MRURoutingSubtitleController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUSubtitleValue text](v14, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "routingSubtitleStateController:didUpdateText:icon:accessory:", self, v20, v10, -[MRUSubtitleValue accessory](v14, "accessory"));

  }
}

- (int64_t)nextAvailableTextState
{
  int64_t state;
  int64_t v4;
  uint64_t v5;
  NSMutableDictionary *storage;
  void *v7;
  void *v8;

  state = self->_state;
  v4 = state;
  while (1)
  {
    v5 = ((unint64_t)(v4 + 1) * (unsigned __int128)0x2492492492492493uLL) >> 64;
    v4 = v4 + 1 - 7 * ((v5 + ((unint64_t)(v4 + 1 - v5) >> 1)) >> 2);
    if (v4 == state)
      break;
    storage = self->_storage;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](storage, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      return v4;
  }
  return state;
}

- (int64_t)state
{
  return self->_state;
}

- (MRURoutingSubtitleControllerDelegate)delegate
{
  return (MRURoutingSubtitleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
