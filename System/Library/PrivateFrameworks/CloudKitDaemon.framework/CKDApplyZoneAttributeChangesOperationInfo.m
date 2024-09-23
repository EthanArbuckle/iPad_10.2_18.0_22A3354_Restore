@implementation CKDApplyZoneAttributeChangesOperationInfo

- (CKDApplyZoneAttributeChangesOperationInfo)initWithZone:(id)a3
{
  id v5;
  CKDApplyZoneAttributeChangesOperationInfo *v6;
  CKDApplyZoneAttributeChangesOperationInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKDApplyZoneAttributeChangesOperationInfo;
  v6 = -[CKOperationInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_zone, a3);

  return v7;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
  objc_storeStrong((id *)&self->_zone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
}

@end
