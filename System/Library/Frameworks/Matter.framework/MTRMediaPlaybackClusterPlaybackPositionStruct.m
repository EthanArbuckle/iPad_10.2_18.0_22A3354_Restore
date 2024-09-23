@implementation MTRMediaPlaybackClusterPlaybackPositionStruct

- (MTRMediaPlaybackClusterPlaybackPositionStruct)init
{
  MTRMediaPlaybackClusterPlaybackPositionStruct *v2;
  MTRMediaPlaybackClusterPlaybackPositionStruct *v3;
  NSNumber *updatedAt;
  NSNumber *position;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRMediaPlaybackClusterPlaybackPositionStruct;
  v2 = -[MTRMediaPlaybackClusterPlaybackPositionStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    updatedAt = v2->_updatedAt;
    v2->_updatedAt = (NSNumber *)&unk_250591B18;

    position = v3->_position;
    v3->_position = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRMediaPlaybackClusterPlaybackPositionStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRMediaPlaybackClusterPlaybackPositionStruct);
  objc_msgSend_updatedAt(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUpdatedAt_(v4, v8, (uint64_t)v7);

  objc_msgSend_position(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPosition_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: updatedAt:%@; position:%@; >"),
    v5,
    self->_updatedAt,
    self->_position);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)updatedAt
{
  return self->_updatedAt;
}

- (void)setUpdatedAt:(NSNumber *)updatedAt
{
  objc_setProperty_nonatomic_copy(self, a2, updatedAt, 8);
}

- (NSNumber)position
{
  return self->_position;
}

- (void)setPosition:(NSNumber *)position
{
  objc_setProperty_nonatomic_copy(self, a2, position, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
}

@end
