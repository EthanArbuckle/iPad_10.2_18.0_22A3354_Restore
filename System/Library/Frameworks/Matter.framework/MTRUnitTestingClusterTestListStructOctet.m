@implementation MTRUnitTestingClusterTestListStructOctet

- (MTRUnitTestingClusterTestListStructOctet)init
{
  MTRUnitTestingClusterTestListStructOctet *v2;
  MTRUnitTestingClusterTestListStructOctet *v3;
  NSNumber *member1;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSData *member2;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRUnitTestingClusterTestListStructOctet;
  v2 = -[MTRUnitTestingClusterTestListStructOctet init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    member1 = v2->_member1;
    v2->_member1 = (NSNumber *)&unk_250591B18;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    member2 = v3->_member2;
    v3->_member2 = (NSData *)v7;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterTestListStructOctet *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRUnitTestingClusterTestListStructOctet);
  objc_msgSend_member1(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMember1_(v4, v8, (uint64_t)v7);

  objc_msgSend_member2(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMember2_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *member1;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  member1 = self->_member1;
  objc_msgSend_base64EncodedStringWithOptions_(self->_member2, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@: member1:%@; member2:%@; >"), v5, member1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSNumber)member1
{
  return self->_member1;
}

- (void)setMember1:(NSNumber *)member1
{
  objc_setProperty_nonatomic_copy(self, a2, member1, 8);
}

- (NSData)member2
{
  return self->_member2;
}

- (void)setMember2:(NSData *)member2
{
  objc_setProperty_nonatomic_copy(self, a2, member2, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_member2, 0);
  objc_storeStrong((id *)&self->_member1, 0);
}

@end
