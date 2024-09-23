@implementation IATextInputActionsSessionReplaceWithCandidateAction

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

- (int64_t)replaceWithCandidateType
{
  return self->_replaceWithCandidateType;
}

- (void)setReplaceWithCandidateType:(int64_t)a3
{
  self->_replaceWithCandidateType = a3;
}

- (IATextInputActionsSessionReplaceWithCandidateAction)initWithCoder:(id)a3
{
  id v4;
  IATextInputActionsSessionReplaceWithCandidateAction *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IATextInputActionsSessionReplaceWithCandidateAction;
  v5 = -[IATextInputActionsSessionAction initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("replaceWithCandidateType"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_replaceWithCandidateType = objc_msgSend_longValue(v9, v10, v11, v12, v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IATextInputActionsSessionReplaceWithCandidateAction;
  v4 = a3;
  -[IATextInputActionsSessionAction encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend_numberWithLong_(MEMORY[0x24BDD16E0], v5, self->_replaceWithCandidateType, v6, v7, v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, (uint64_t)CFSTR("replaceWithCandidateType"), v10);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
