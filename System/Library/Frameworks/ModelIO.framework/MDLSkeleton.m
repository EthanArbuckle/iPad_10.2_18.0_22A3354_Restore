@implementation MDLSkeleton

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  _QWORD *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v4 = (void *)objc_msgSend_allocWithZone_(MDLSkeleton, a2, (uint64_t)a3);
  objc_msgSend_name(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)objc_msgSend_initWithName_jointPaths_(v4, v8, (uint64_t)v7, self->_jointPaths);

  v12 = objc_msgSend_copy(self->_jointBindTransforms, v10, v11);
  v13 = (void *)v9[8];
  v9[8] = v12;

  v16 = objc_msgSend_copy(self->_jointBindTransforms, v14, v15);
  v17 = (void *)v9[9];
  v9[9] = v16;

  return v9;
}

- (MDLSkeleton)initWithName:(NSString *)name jointPaths:(NSArray *)jointPaths
{
  NSString *v6;
  NSArray *v7;
  const char *v8;
  uint64_t v9;
  MDLSkeleton *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  MDLMatrix4x4Array *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  MDLMatrix4x4Array *jointBindTransforms;
  MDLMatrix4x4Array *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  MDLMatrix4x4Array *jointRestTransforms;
  MDLSkeleton *v31;
  objc_super v33;

  v6 = name;
  v7 = jointPaths;
  v33.receiver = self;
  v33.super_class = (Class)MDLSkeleton;
  v10 = -[MDLObject init](&v33, sel_init);
  if (v10)
  {
    v11 = (void *)objc_msgSend_copy(v6, v8, v9);
    objc_msgSend_setName_(v10, v12, (uint64_t)v11);

    v15 = objc_msgSend_copy(v7, v13, v14);
    v16 = v10->_jointPaths;
    v10->_jointPaths = (NSArray *)v15;

    v17 = [MDLMatrix4x4Array alloc];
    v20 = objc_msgSend_count(v10->_jointPaths, v18, v19);
    v22 = objc_msgSend_initWithElementCount_(v17, v21, v20);
    jointBindTransforms = v10->_jointBindTransforms;
    v10->_jointBindTransforms = (MDLMatrix4x4Array *)v22;

    v24 = [MDLMatrix4x4Array alloc];
    v27 = objc_msgSend_count(v10->_jointPaths, v25, v26);
    v29 = objc_msgSend_initWithElementCount_(v24, v28, v27);
    jointRestTransforms = v10->_jointRestTransforms;
    v10->_jointRestTransforms = (MDLMatrix4x4Array *)v29;

    v31 = v10;
  }

  return v10;
}

- (NSArray)jointPaths
{
  return self->_jointPaths;
}

- (MDLMatrix4x4Array)jointBindTransforms
{
  return self->_jointBindTransforms;
}

- (MDLMatrix4x4Array)jointRestTransforms
{
  return self->_jointRestTransforms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jointRestTransforms, 0);
  objc_storeStrong((id *)&self->_jointBindTransforms, 0);
  objc_storeStrong((id *)&self->_jointPaths, 0);
}

@end
