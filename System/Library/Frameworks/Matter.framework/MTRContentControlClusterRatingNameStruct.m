@implementation MTRContentControlClusterRatingNameStruct

- (MTRContentControlClusterRatingNameStruct)init
{
  MTRContentControlClusterRatingNameStruct *v2;
  MTRContentControlClusterRatingNameStruct *v3;
  NSString *ratingName;
  NSString *ratingNameDesc;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRContentControlClusterRatingNameStruct;
  v2 = -[MTRContentControlClusterRatingNameStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    ratingName = v2->_ratingName;
    v2->_ratingName = (NSString *)&stru_2505249E8;

    ratingNameDesc = v3->_ratingNameDesc;
    v3->_ratingNameDesc = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRContentControlClusterRatingNameStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRContentControlClusterRatingNameStruct);
  objc_msgSend_ratingName(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRatingName_(v4, v8, (uint64_t)v7);

  objc_msgSend_ratingNameDesc(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRatingNameDesc_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: ratingName:%@; ratingNameDesc:%@; >"),
    v5,
    self->_ratingName,
    self->_ratingNameDesc);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)ratingName
{
  return self->_ratingName;
}

- (void)setRatingName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)ratingNameDesc
{
  return self->_ratingNameDesc;
}

- (void)setRatingNameDesc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingNameDesc, 0);
  objc_storeStrong((id *)&self->_ratingName, 0);
}

@end
