@implementation SGBloomFilterChunkInMemorySparse

- (SGBloomFilterChunkInMemorySparse)init
{
  SGBloomFilterChunkInMemorySparse *v2;
  uint64_t v3;
  NSMutableSet *hashes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGBloomFilterChunkInMemorySparse;
  v2 = -[SGBloomFilterChunkInMemorySparse init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    hashes = v2->_hashes;
    v2->_hashes = (NSMutableSet *)v3;

  }
  return v2;
}

- (unsigned)count
{
  return -[NSMutableSet count](self->_hashes, "count");
}

- (void)add:(id)a3
{
  NSMutableSet *hashes;
  id v4;

  hashes = self->_hashes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3.var0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](hashes, "addObject:", v4);

}

- (BOOL)exists:(id)a3
{
  NSMutableSet *hashes;
  void *v4;

  hashes = self->_hashes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3.var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(hashes) = -[NSMutableSet containsObject:](hashes, "containsObject:", v4);

  return (char)hashes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashes, 0);
}

@end
