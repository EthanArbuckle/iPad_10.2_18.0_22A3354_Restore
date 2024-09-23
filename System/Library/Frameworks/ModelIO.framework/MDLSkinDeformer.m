@implementation MDLSkinDeformer

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend_allocWithZone_(MDLSkinDeformer, a2, (uint64_t)a3);
  return (id)MEMORY[0x1E0DE7D20](v4, sel_initWithJointPaths_jointBindTransforms_meshBindTransform_, self->_jointPaths);
}

- (MDLSkinDeformer)initWithJointPaths:(__n128)a3 jointBindTransforms:(__n128)a4 meshBindTransform:(__n128)a5
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  MDLSkinDeformer *v14;
  uint64_t v15;
  NSArray *jointPaths;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSData *jointBindTransforms;
  MDLSkinDeformer *v21;
  objc_super v27;

  v10 = a7;
  v11 = a8;
  v27.receiver = a1;
  v27.super_class = (Class)MDLSkinDeformer;
  v14 = -[MDLSkinDeformer init](&v27, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v10, v12, v13);
    jointPaths = v14->_jointPaths;
    v14->_jointPaths = (NSArray *)v15;

    v19 = objc_msgSend_copy(v11, v17, v18);
    jointBindTransforms = v14->_jointBindTransforms;
    v14->_jointBindTransforms = (NSData *)v19;

    *(__n128 *)&v14[1].super.isa = a2;
    *(__n128 *)&v14[1]._jointBindTransforms = a3;
    *(__n128 *)&v14[2].super.isa = a4;
    *(__n128 *)&v14[2]._jointBindTransforms = a5;
    v21 = v14;
  }

  return v14;
}

- (MDLSkinDeformer)initWithJointPaths:(__n128)a3 jointBindTransforms:(__n128)a4 count:(__n128)a5 meshBindTransform:(uint64_t)a6
{
  id v12;
  const char *v13;
  uint64_t v14;
  MDLSkinDeformer *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *jointPaths;
  id v20;
  const char *v21;
  uint64_t v22;
  NSData *jointBindTransforms;
  MDLSkinDeformer *v24;
  objc_super v30;

  v12 = a7;
  v30.receiver = a1;
  v30.super_class = (Class)MDLSkinDeformer;
  v15 = -[MDLSkinDeformer init](&v30, sel_init);
  if (!v15)
    goto LABEL_5;
  if (objc_msgSend_count(v12, v13, v14) != a9)
  {
    NSLog(CFSTR("jointPath.count and jointBindTransforms.length * sizeof(matrix_float4x4) have to be equal."));
LABEL_5:
    v24 = 0;
    goto LABEL_6;
  }
  v18 = objc_msgSend_copy(v12, v16, v17);
  jointPaths = v15->_jointPaths;
  v15->_jointPaths = (NSArray *)v18;

  v20 = objc_alloc(MEMORY[0x1E0C99D50]);
  v22 = objc_msgSend_initWithBytes_length_(v20, v21, a8, a9 << 6);
  jointBindTransforms = v15->_jointBindTransforms;
  v15->_jointBindTransforms = (NSData *)v22;

  *(__n128 *)&v15[1].super.isa = a2;
  *(__n128 *)&v15[1]._jointBindTransforms = a3;
  *(__n128 *)&v15[2].super.isa = a4;
  *(__n128 *)&v15[2]._jointBindTransforms = a5;
  v24 = v15;
LABEL_6:

  return v24;
}

- (unint64_t)copyJointBindTransformsInto:(id *)a3 maxCount:(unint64_t)a4
{
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  const void *v11;
  const char *v12;
  uint64_t v13;
  size_t v14;

  v7 = objc_msgSend_length(self->_jointBindTransforms, a2, (uint64_t)a3);
  v10 = v7 >> 6;
  if (v7 >> 6 > a4)
    NSLog(CFSTR("jointBindTransformsArray size is too small (%lu elements) to hold all %lu elements"), a4, v7 >> 6);
  v11 = (const void *)objc_msgSend_bytes(self->_jointBindTransforms, v8, v9);
  v14 = objc_msgSend_length(self->_jointBindTransforms, v12, v13);
  memcpy(a3, v11, v14);
  return v10;
}

- (NSArray)jointPaths
{
  return self->_jointPaths;
}

- (NSData)jointBindTransforms
{
  return self->_jointBindTransforms;
}

- (__n128)meshBindTransform
{
  return a1[2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jointBindTransforms, 0);
  objc_storeStrong((id *)&self->_jointPaths, 0);
}

@end
