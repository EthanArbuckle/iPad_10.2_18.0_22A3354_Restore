@implementation SGMITokenCounts

- (SGMITokenCounts)initWithSalientCount:(id)a3 regularCount:(id)a4 token:(id)a5
{
  id v9;
  id v10;
  id v11;
  SGMITokenCounts *v12;
  SGMITokenCounts *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SGMITokenCounts;
  v12 = -[SGMITokenCounts init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_salientCount, a3);
    objc_storeStrong((id *)&v13->_regularCount, a4);
    objc_storeStrong((id *)&v13->_token, a5);
  }

  return v13;
}

- (SGMITokenCounts)init
{
  return -[SGMITokenCounts initWithSalientCount:regularCount:token:](self, "initWithSalientCount:regularCount:token:", &unk_1E7E0CA88, &unk_1E7E0CA88, &stru_1E7DB83A8);
}

- (SGMITokenCounts)initWithCount:(id)a3 asSalient:(BOOL)a4 token:(id)a5
{
  id v5;
  id v6;

  if (a4)
    v5 = a3;
  else
    v5 = &unk_1E7E0CA88;
  if (a4)
    v6 = &unk_1E7E0CA88;
  else
    v6 = a3;
  return -[SGMITokenCounts initWithSalientCount:regularCount:token:](self, "initWithSalientCount:regularCount:token:", v5, v6, a5);
}

- (id)newByAdding:(id)a3 asSalient:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  SGMITokenCounts *v17;
  void *v18;
  SGMITokenCounts *v19;

  v4 = a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[SGMITokenCounts salientCount](self, "salientCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longValue");
  if (v4)
    v10 = objc_msgSend(v6, "longValue");
  else
    v10 = 0;
  objc_msgSend(v7, "numberWithLong:", v10 + v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[SGMITokenCounts regularCount](self, "regularCount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "longValue");
  if (v4)
    v15 = 0;
  else
    v15 = objc_msgSend(v6, "longValue");
  objc_msgSend(v12, "numberWithLong:", v15 + v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [SGMITokenCounts alloc];
  -[SGMITokenCounts token](self, "token");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SGMITokenCounts initWithSalientCount:regularCount:token:](v17, "initWithSalientCount:regularCount:token:", v11, v16, v18);

  return v19;
}

- (id)description
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGMITokenCounts[%@]: %@ salient ; %@ regular>"),
                                           self->_token,
                                           self->_salientCount,
                                           self->_regularCount));
}

- (NSNumber)salientCount
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)regularCount
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)token
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_regularCount, 0);
  objc_storeStrong((id *)&self->_salientCount, 0);
}

@end
