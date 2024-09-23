@implementation CRKFetchChaptersResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchChaptersResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchChaptersResultObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *chapters;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKFetchChaptersResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("chapters"));
    v9 = objc_claimAutoreleasedReturnValue();
    chapters = v5->_chapters;
    v5->_chapters = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKFetchChaptersResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKFetchChaptersResultObject chapters](self, "chapters", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("chapters"));

}

- (NSArray)chapters
{
  return self->_chapters;
}

- (void)setChapters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapters, 0);
}

@end
