@implementation CKNanoCommSafetySendContext

+ (id)contextKey
{
  return CFSTR("CKCommSafetyContextKeyNanoSend");
}

- (CKComposition)composition
{
  return self->_composition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composition, 0);
}

@end
