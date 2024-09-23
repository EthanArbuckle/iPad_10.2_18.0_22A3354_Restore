@implementation ASCHasher

+ (unint64_t)executionSeed
{
  if (executionSeed_onceToken != -1)
    dispatch_once(&executionSeed_onceToken, &__block_literal_global_8);
  return executionSeed_executionSeed;
}

void __26__ASCHasher_executionSeed__block_invoke()
{
  arc4random_buf(&executionSeed_executionSeed, 8uLL);
}

- (ASCHasher)init
{
  ASCHasher *v2;
  uint64_t v3;
  NSMutableData *buffer;
  unint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCHasher;
  v2 = -[ASCHasher init](&v7, sel_init);
  if (v2)
  {
    v6 = +[ASCHasher executionSeed](ASCHasher, "executionSeed");
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", &v6, 8);
    buffer = v2->_buffer;
    v2->_buffer = (NSMutableData *)v3;

    v2->_isFinalized = 0;
  }
  return v2;
}

- (void)combineBytes:(const void *)a3 length:(unint64_t)a4
{
  id v7;
  id v8;

  if (-[ASCHasher isFinalized](self, "isFinalized"))
  {
    v7 = objc_alloc(MEMORY[0x1E0C99DA0]);
    objc_exception_throw((id)objc_msgSend(v7, "initWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Cannot combine additional values into finalized hasher"), 0));
  }
  -[ASCHasher buffer](self, "buffer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendBytes:length:", a3, a4);

}

- (void)combineBool:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](self, "combineObject:", v4);

}

- (void)combineDouble:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](self, "combineObject:", v4);

}

- (void)combineInteger:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](self, "combineObject:", v4);

}

- (void)combineUnsignedInteger:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](self, "combineObject:", v4);

}

- (void)combineObject:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "hash");
  -[ASCHasher combineBytes:length:](self, "combineBytes:length:", &v4, 8);
}

- (unint64_t)finalizeHash
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v7;

  if (-[ASCHasher isFinalized](self, "isFinalized"))
  {
    v7 = objc_alloc(MEMORY[0x1E0C99DA0]);
    objc_exception_throw((id)objc_msgSend(v7, "initWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Cannot finalize hasher multiple times"), 0));
  }
  -[ASCHasher buffer](self, "buffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[ASCHasher setIsFinalized:](self, "setIsFinalized:", 1);
  -[ASCHasher buffer](self, "buffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLength:", 0);

  return v4;
}

- (NSMutableData)buffer
{
  return self->_buffer;
}

- (BOOL)isFinalized
{
  return self->_isFinalized;
}

- (void)setIsFinalized:(BOOL)a3
{
  self->_isFinalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
