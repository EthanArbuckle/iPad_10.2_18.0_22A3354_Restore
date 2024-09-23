@implementation ANSTHand

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTHand)init
{
  ANSTHand *result;

  result = (ANSTHand *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTHand)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7
{
  id v9;
  const char *v10;
  ANSTHand *result;

  v9 = a5;
  result = (ANSTHand *)objc_msgSend_doesNotRecognizeSelector_(self, v10, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTHand)initWithAcObject:(id *)a3
{
  unsigned int var2;
  uint64_t var1;
  uint64_t v7;
  uint64_t var0;
  void *v9;
  const char *v10;
  ANSTHand *v11;

  var1 = a3->var1;
  var2 = a3->var2;
  if (var2 == 10)
    v7 = 1;
  else
    v7 = 2 * (var2 == 11);
  var0 = a3->var0;
  ANSTObjectCategoryFromAcDetCategory(var2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (ANSTHand *)objc_msgSend_initWithObjectID_groupID_category_boundingBox_confidence_chirality_(self, v10, var0, var1, v9, a3->var4, v7, a3->var3.var0, a3->var3.var1, a3->var3.var2, a3->var3.var3);

  return v11;
}

- (ANSTHand)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7 chirality:(int64_t)a8
{
  ANSTHand *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ANSTHand;
  result = -[ANSTObject initWithObjectID:groupID:category:boundingBox:confidence:](&v10, sel_initWithObjectID_groupID_category_boundingBox_confidence_, a3, a4, a5, a7, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  result->_chirality = a8;
  return result;
}

- (ANSTHand)initWithCoder:(id)a3
{
  id v4;
  ANSTHand *v5;
  ANSTHand *v6;
  ANSTHand *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ANSTHand;
  v5 = -[ANSTObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5 && sub_2358E124C(v4, &v5->_chirality, sel_chirality))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ANSTHand;
  v4 = a3;
  -[ANSTObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  sub_2358E1360(v4, self->_chirality, sel_chirality);

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
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend_appendFormat_(v3, v4, (uint64_t)CFSTR("<ANSTHand %p> {\n"), self);
  v7 = objc_msgSend_objectID(self, v5, v6);
  objc_msgSend_appendFormat_(v3, v8, (uint64_t)CFSTR("    objectID    %lu\n"), v7);
  objc_msgSend_category(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v12, (uint64_t)CFSTR("    category    %@\n"), v11);

  objc_msgSend_boundingBox(self, v13, v14);
  sub_2358E0C58(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v20, (uint64_t)CFSTR("    boundingBox %@\n"), v19);

  v23 = objc_msgSend_confidence(self, v21, v22);
  objc_msgSend_appendFormat_(v3, v24, (uint64_t)CFSTR("    confidence  %lu\n"), v23);
  objc_msgSend_appendFormat_(v3, v25, (uint64_t)CFSTR("    chirality   %ld\n"), self->_chirality);
  objc_msgSend_appendString_(v3, v26, (uint64_t)CFSTR("}"));
  v29 = (void *)objc_msgSend_copy(v3, v27, v28);

  return v29;
}

- (id)debugJSONDictionary
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  unint64_t chirality;
  const __CFString *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ANSTHand;
  -[ANSTObject debugJSONDictionary](&v15, sel_debugJSONDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  chirality = self->_chirality;
  if (chirality > 2)
    v8 = CFSTR("ERROR");
  else
    v8 = off_2506E3E40[chirality];
  NSStringFromSelector(sel_chirality);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v10, (uint64_t)v8, v9);

  v13 = (void *)objc_msgSend_copy(v6, v11, v12);
  return v13;
}

- (int64_t)chirality
{
  return self->_chirality;
}

@end
