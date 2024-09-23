@implementation HMObjectMergePair

- (HMObjectMergePair)initWithOldObject:(id)a3 updatedObject:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMObjectMergePair *v10;
  HMObjectMergePair *v11;
  HMObjectMergePair *v13;
  SEL v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMObjectMergePair *)_HMFPreconditionFailure();
    return (HMObjectMergePair *)-[HMObjectMergePair oldObject](v13, v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)HMObjectMergePair;
  v10 = -[HMObjectMergePair init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_oldObject, a3);
    objc_storeStrong((id *)&v11->_updatedObject, a4);
  }

  return v11;
}

- (HMObjectMerge)oldObject
{
  return (HMObjectMerge *)objc_getProperty(self, a2, 8, 1);
}

- (HMObjectMerge)updatedObject
{
  return (HMObjectMerge *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedObject, 0);
  objc_storeStrong((id *)&self->_oldObject, 0);
}

@end
