@implementation ANSTObject

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTObject)init
{
  ANSTObject *result;

  result = (ANSTObject *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTObject)initWithAcObject:(id *)a3
{
  uint64_t var0;
  uint64_t var1;
  void *v7;
  const char *v8;
  ANSTObject *v9;

  var0 = a3->var0;
  var1 = a3->var1;
  ANSTObjectCategoryFromAcDetCategory(a3->var2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (ANSTObject *)objc_msgSend_initWithObjectID_groupID_category_boundingBox_confidence_(self, v8, var0, var1, v7, a3->var4, a3->var3.var0, a3->var3.var1, a3->var3.var2, a3->var3.var3);

  return v9;
}

- (ANSTObject)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  ANSTObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *category;
  objc_super v21;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)ANSTObject;
  v14 = a5;
  v15 = -[ANSTObject init](&v21, sel_init);
  v15->_objectID = a3;
  v18 = objc_msgSend_copy(v14, v16, v17, v21.receiver, v21.super_class);

  category = v15->_category;
  v15->_category = (NSString *)v18;

  v15->_boundingBox.origin.x = x;
  v15->_boundingBox.origin.y = y;
  v15->_boundingBox.size.width = width;
  v15->_boundingBox.size.height = height;
  v15->_confidence = a7;
  v15->_groupID = a4;
  return v15;
}

- (ANSTObject)initWithCoder:(id)a3
{
  id v4;
  ANSTObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSString *category;
  ANSTObject *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ANSTObject;
  v5 = -[ANSTObject init](&v14, sel_init);
  if (!sub_2358E0814(v4, (uint64_t *)&v5->_objectID, sel_objectID))
    goto LABEL_7;
  if (!sub_2358E0814(v4, (uint64_t *)&v5->_groupID, sel_groupID))
    goto LABEL_7;
  if (!sub_2358E0814(v4, (uint64_t *)&v5->_confidence, sel_confidence))
    goto LABEL_7;
  if (!sub_2358E08B0(v4, (uint64_t)&v5->_boundingBox, sel_boundingBox))
    goto LABEL_7;
  v6 = v4;
  v7 = objc_opt_class();
  NSStringFromSelector(sel_category);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v6, v9, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue();

  category = v5->_category;
  v5->_category = (NSString *)v10;

  if (v5->_category)
    v12 = v5;
  else
LABEL_7:
    v12 = 0;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *category;
  NSString *v6;
  void *v7;
  const char *v8;
  id v9;

  v4 = a3;
  sub_2358E0A48(v4, self->_objectID, sel_objectID);
  category = self->_category;
  v9 = v4;
  v6 = category;
  NSStringFromSelector(sel_category);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v9, v8, (uint64_t)v6, v7);

  sub_2358E0AC8(v9, sel_boundingBox, self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  sub_2358E0A48(v9, self->_confidence, sel_confidence);
  sub_2358E0A48(v9, self->_groupID, sel_groupID);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend_appendFormat_(v3, v4, (uint64_t)CFSTR("<ANSTObject %p> {\n"), self);
  objc_msgSend_appendFormat_(v3, v5, (uint64_t)CFSTR("    objectID    %lu\n"), self->_objectID);
  objc_msgSend_appendFormat_(v3, v6, (uint64_t)CFSTR("    groupID     %lu\n"), self->_groupID);
  objc_msgSend_appendFormat_(v3, v7, (uint64_t)CFSTR("    category    %@\n"), self->_category);
  sub_2358E0C58(self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v9, (uint64_t)CFSTR("    boundingBox %@\n"), v8);

  objc_msgSend_appendFormat_(v3, v10, (uint64_t)CFSTR("    confidence  %lu\n"), self->_confidence);
  objc_msgSend_appendString_(v3, v11, (uint64_t)CFSTR("}"));
  v14 = (void *)objc_msgSend_copy(v3, v12, v13);

  return v14;
}

- (id)debugJSONDictionary
{
  void *v3;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSString *category;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;

  v3 = (void *)objc_opt_new();
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v4, self->_objectID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_objectID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v5, v6);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v8, self->_groupID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_groupID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v9, v10);

  category = self->_category;
  NSStringFromSelector(sel_category);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)category, v13);

  sub_2358E0F0C(self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_boundingBox);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v18, v19);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v21, self->_confidence);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_confidence);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v22, v23);

  v27 = (void *)objc_msgSend_copy(v3, v25, v26);
  return v27;
}

- (unint64_t)objectID
{
  return self->_objectID;
}

- (unint64_t)groupID
{
  return self->_groupID;
}

- (NSString)category
{
  return self->_category;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
}

@end
