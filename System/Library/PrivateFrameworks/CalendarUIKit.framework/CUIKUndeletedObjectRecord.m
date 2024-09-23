@implementation CUIKUndeletedObjectRecord

- (EKObject)undeletedObject
{
  return self->_undeletedObject;
}

- (void)setUndeletedObject:(id)a3
{
  objc_storeStrong((id *)&self->_undeletedObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undeletedObject, 0);
}

@end
