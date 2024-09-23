@implementation SGDateComponents

- (SGDateComponents)initWithDateComponents:(id)a3 label:(id)a4 extractionInfo:(id)a5 recordId:(id)a6
{
  id v10;
  SGDateComponents *v11;
  uint64_t v12;
  NSDateComponents *dateComponents;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGDateComponents;
  v11 = -[SGLabeledObject initWithLabel:extractionInfo:recordId:](&v15, sel_initWithLabel_extractionInfo_recordId_, a4, a5, a6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    dateComponents = v11->_dateComponents;
    v11->_dateComponents = (NSDateComponents *)v12;

  }
  return v11;
}

- (SGDateComponents)initWithCoder:(id)a3
{
  id v4;
  SGDateComponents *v5;
  void *v6;
  uint64_t v7;
  NSDateComponents *dateComponents;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SGDateComponents;
  v5 = -[SGLabeledObject initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("dateComponents"));
    v7 = objc_claimAutoreleasedReturnValue();
    dateComponents = v5->_dateComponents;
    v5->_dateComponents = (NSDateComponents *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGDateComponents;
  v4 = a3;
  -[SGLabeledObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_dateComponents, CFSTR("dateComponents"), v5.receiver, v5.super_class);

}

- (BOOL)isEqual:(id)a3
{
  SGDateComponents *v4;
  SGDateComponents *v5;
  BOOL v6;

  v4 = (SGDateComponents *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGDateComponents isEqualToDateComponents:](self, "isEqualToDateComponents:", v5);

  return v6;
}

- (BOOL)isEqualToDateComponents:(id)a3
{
  _QWORD *v4;
  NSDateComponents *v5;
  NSDateComponents *v6;
  char v7;

  v4 = a3;
  if (-[SGObject isEqualToSuggestion:](self, "isEqualToSuggestion:", v4))
  {
    v5 = self->_dateComponents;
    v6 = v5;
    if (v5 == (NSDateComponents *)v4[5])
      v7 = 1;
    else
      v7 = -[NSDateComponents isEqual:](v5, "isEqual:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSDateComponents hash](self->_dateComponents, "hash");
}

- (id)dateString
{
  NSInteger v3;
  id v4;
  NSInteger v5;
  NSInteger v6;
  void *v7;
  uint64_t v9;

  v3 = -[NSDateComponents year](self->_dateComponents, "year");
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = -[NSDateComponents month](self->_dateComponents, "month");
  v6 = -[NSDateComponents day](self->_dateComponents, "day");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%ld/%ld"), v5, v6, v9);
  else
    v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%ld/%ld/%ld"), v5, v6, -[NSDateComponents year](self->_dateComponents, "year"));
  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  NSDateComponents *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGLabeledObject label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    -[SGLabeledObject label](self, "label");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("unlabeled");
  }
  v7 = self->_dateComponents;
  v8 = -[NSDateComponents year](v7, "year");
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = -[NSDateComponents month](v7, "month");
  v11 = -[NSDateComponents day](v7, "day");
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {

    v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%ld/%ld"), v10, v11, v17);
  }
  else
  {
    v13 = -[NSDateComponents year](v7, "year");

    v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%ld/%ld/%ld"), v10, v11, v13);
  }
  v14 = (void *)v12;
  v15 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@/'%@'"), v6, v12);

  if (v5)
  return v15;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponents, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)dateComponents:(id)a3 label:(id)a4 extractionInfo:(id)a5 withRecordId:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  SGDateComponents *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[SGDateComponents initWithDateComponents:label:extractionInfo:recordId:]([SGDateComponents alloc], "initWithDateComponents:label:extractionInfo:recordId:", v12, v11, v10, v9);

  return v13;
}

@end
