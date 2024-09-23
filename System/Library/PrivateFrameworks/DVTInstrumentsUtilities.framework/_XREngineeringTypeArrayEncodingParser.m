@implementation _XREngineeringTypeArrayEncodingParser

+ (id)_elementNameToClassMap
{
  if (qword_25583C818 != -1)
    dispatch_once(&qword_25583C818, &unk_24EDC4210);
  return (id)qword_25583C810;
}

- (void)_handleStart
{
  NSMutableArray *v3;
  NSMutableArray *fixedTypes;

  v3 = (NSMutableArray *)objc_opt_new();
  fixedTypes = self->_fixedTypes;
  self->_fixedTypes = v3;

}

- (void)setSlot:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSMutableArray *fixedTypes;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  fixedTypes = self->_fixedTypes;
  v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_addObject_(fixedTypes, v6, (uint64_t)v9, v7, v8);

}

- (void)setRemainder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSString *v6;
  NSString *remainderType;

  v6 = (NSString *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  remainderType = self->_remainderType;
  self->_remainderType = v6;

}

- (void)_handleCompletion
{
  XRXMLElementParser *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = self->super.parent->parent;
  v13 = (id)objc_opt_new();
  objc_msgSend_setFixedTypes_(v13, v4, (uint64_t)self->_fixedTypes, v5, v6);
  objc_msgSend_setRemainderType_(v13, v7, (uint64_t)self->_remainderType, v8, v9);
  objc_msgSend_setEncodingConvention_(v3, v10, (uint64_t)v13, v11, v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainderType, 0);
  objc_storeStrong((id *)&self->_fixedTypes, 0);
}

@end
