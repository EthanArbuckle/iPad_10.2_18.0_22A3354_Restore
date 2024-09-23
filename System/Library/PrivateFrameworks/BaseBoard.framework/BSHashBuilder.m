@implementation BSHashBuilder

- (unint64_t)hash
{
  return self->_hash;
}

+ (id)builder
{
  return objc_alloc_init(BSHashBuilder);
}

- (id)appendInt64:(int64_t)a3
{
  unint64_t v3;

  v3 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (a3 ^ ((unint64_t)a3 >> 30))) ^ ((0xBF58476D1CE4E5B9
                                                                       * (a3 ^ ((unint64_t)a3 >> 30))) >> 27));
  *((_QWORD *)self + 1) ^= (v3 >> 31) ^ v3;
  return self;
}

- (id)appendString:(id)a3
{
  unint64_t hash;
  unint64_t v5;
  unint64_t v6;

  hash = self->_hash;
  v5 = objc_msgSend(a3, "hash");
  v6 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) >> 27));
  self->_hash = hash ^ (v6 >> 31) ^ v6;
  return self;
}

- (id)appendObject:(id)a3
{
  unint64_t hash;
  unint64_t v5;
  unint64_t v6;

  hash = self->_hash;
  v5 = objc_msgSend(a3, "hash");
  v6 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) >> 27));
  self->_hash = hash ^ (v6 >> 31) ^ v6;
  return self;
}

- (id)appendPointer:(void *)a3
{
  unint64_t v3;

  v3 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * ((unint64_t)a3 ^ ((unint64_t)a3 >> 30))) ^ ((0xBF58476D1CE4E5B9
                                                                                         * ((unint64_t)a3 ^ ((unint64_t)a3 >> 30))) >> 27));
  *((_QWORD *)self + 1) ^= (v3 >> 31) ^ v3;
  return self;
}

- (id)appendBool:(BOOL)a3
{
  unint64_t v3;

  v3 = 0xBF58476D1CE4E5B9;
  if (!a3)
    v3 = 0;
  *((_QWORD *)self + 1) ^= ((0x94D049BB133111EBLL * (v3 ^ (v3 >> 27))) >> 31) ^ (0x94D049BB133111EBLL * (v3 ^ (v3 >> 27)));
  return self;
}

- (id)appendCGPoint:(CGPoint)a3
{
  unint64_t hash;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  hash = self->_hash;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3.x + a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  self->_hash = hash ^ (v7 >> 31) ^ v7;

  return self;
}

- (id)appendDouble:(double)a3
{
  unint64_t hash;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  hash = self->_hash;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  self->_hash = hash ^ (v7 >> 31) ^ v7;

  return self;
}

- (id)appendCGSize:(CGSize)a3
{
  unint64_t hash;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  hash = self->_hash;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3.height * a3.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  self->_hash = hash ^ (v7 >> 31) ^ v7;

  return self;
}

- (id)appendCGRect:(CGRect)a3
{
  unint64_t hash;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  hash = self->_hash;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3.origin.x + a3.origin.y + a3.size.height * a3.size.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  self->_hash = hash ^ (v7 >> 31) ^ v7;

  return self;
}

- (id)appendCGFloat:(double)a3
{
  unint64_t hash;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  hash = self->_hash;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  self->_hash = hash ^ (v7 >> 31) ^ v7;

  return self;
}

- (id)appendClass:(Class)a3
{
  unint64_t v3;

  v3 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * ((unint64_t)a3 ^ ((unint64_t)a3 >> 30))) ^ ((0xBF58476D1CE4E5B9
                                                                                         * ((unint64_t)a3 ^ ((unint64_t)a3 >> 30))) >> 27));
  *((_QWORD *)self + 1) ^= (v3 >> 31) ^ v3;
  return self;
}

- (id)appendHashingBlocks:(id)a3
{
  uint64_t (**v4)(_QWORD);
  uint64_t (**v5)(_QWORD);
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v13;
  uint64_t v14;

  v4 = (uint64_t (**)(_QWORD))a3;
  if (v4)
  {
    v5 = v4;
    v13 = &v14;
    v6 = 17;
    do
    {
      v7 = v5[2](v5);
      v8 = 0x94D049BB133111EBLL
         * ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) >> 27));
      v6 ^= (v8 >> 31) ^ v8;
      v9 = v13++;
      v10 = MEMORY[0x18D769CFC](*v9);

      v5 = (uint64_t (**)(_QWORD))v10;
    }
    while (v10);
    v11 = 0x94D049BB133111EBLL
        * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
    self->_hash ^= (v11 >> 31) ^ v11;
  }
  return self;
}

- (id)appendFloat:(float)a3
{
  unint64_t hash;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  hash = self->_hash;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  self->_hash = hash ^ (v7 >> 31) ^ v7;

  return self;
}

- (id)appendBytes:(const void *)a3 length:(unint64_t)a4
{
  unint64_t v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  void *v13;

  if (a4)
  {
    v5 = a4;
    v6 = (unsigned __int8 *)a3;
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSHashBuilder.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bytesIn != NULL"));

    }
    v7 = 0;
    do
    {
      v8 = *v6++;
      v9 = 0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * v8) ^ ((0xBF58476D1CE4E5B9 * v8) >> 27));
      v7 ^= (v9 >> 31) ^ v9;
      --v5;
    }
    while (v5);
    v10 = 0x94D049BB133111EBLL
        * ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) >> 27));
    self->_hash ^= (v10 >> 31) ^ v10;
  }
  return self;
}

- (id)appendCGAffineTransform:(CGAffineTransform *)a3
{
  unint64_t hash;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;

  hash = self->_hash;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->a);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) >> 27));
  self->_hash = hash ^ (v8 >> 31) ^ v8;

  v9 = self->_hash;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->b);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) >> 27));
  self->_hash = v9 ^ (v12 >> 31) ^ v12;

  v13 = self->_hash;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->c);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  v16 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v15 ^ (v15 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v15 ^ (v15 >> 30))) >> 27));
  self->_hash = v13 ^ (v16 >> 31) ^ v16;

  v17 = self->_hash;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->d);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  v20 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v19 ^ (v19 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v19 ^ (v19 >> 30))) >> 27));
  self->_hash = v17 ^ (v20 >> 31) ^ v20;

  v21 = self->_hash;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->tx);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hash");
  v24 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v23 ^ (v23 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v23 ^ (v23 >> 30))) >> 27));
  self->_hash = v21 ^ (v24 >> 31) ^ v24;

  v25 = self->_hash;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->ty);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hash");
  v28 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v27 ^ (v27 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v27 ^ (v27 >> 30))) >> 27));
  self->_hash = v25 ^ (v28 >> 31) ^ v28;

  return self;
}

- (id)appendArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      v9 = 17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "hash", (_QWORD)v15);
          v12 = 0x94D049BB133111EBLL
              * ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) >> 27));
          v9 ^= (v12 >> 31) ^ v12;
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 17;
    }

    v13 = 0x94D049BB133111EBLL
        * ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) >> 27));
    self->_hash ^= (v13 >> 31) ^ v13;
  }

  return self;
}

@end
