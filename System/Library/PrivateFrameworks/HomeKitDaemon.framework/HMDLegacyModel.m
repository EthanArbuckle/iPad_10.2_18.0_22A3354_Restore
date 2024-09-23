@implementation HMDLegacyModel

+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x24BDBCE88];
  v10 = *MEMORY[0x24BDBCAB0];
  v11 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v13, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
}

- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x24BDBCE88];
  v13 = *MEMORY[0x24BDBCAB0];
  v14 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v16, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v17);
}

@end
