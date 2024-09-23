@implementation _CNCompactMapEnumerator

- (_CNCompactMapEnumerator)initWithEnumerator:(id)a3 transform:(id)a4
{
  id v7;
  id v8;
  _CNCompactMapEnumerator *v9;
  _CNCompactMapEnumerator *v10;
  uint64_t v11;
  id transform;
  _CNCompactMapEnumerator *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CNCompactMapEnumerator;
  v9 = -[_CNCompactMapEnumerator init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enumerator, a3);
    v11 = objc_msgSend(v8, "copy");
    transform = v10->_transform;
    v10->_transform = (id)v11;

    v13 = v10;
  }

  return v10;
}

- (id)nextObject
{
  NSEnumerator *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_enumerator;
  v4 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        (*((void (**)(id))self->_transform + 2))(self->_transform);
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = (void *)v8;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transform, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end
