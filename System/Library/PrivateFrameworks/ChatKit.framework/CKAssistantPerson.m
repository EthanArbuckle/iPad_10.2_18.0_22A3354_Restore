@implementation CKAssistantPerson

- (NSString)internalGUID
{
  return self->_internalGUID;
}

- (void)setInternalGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_internalGUID, 0);
}

@end
