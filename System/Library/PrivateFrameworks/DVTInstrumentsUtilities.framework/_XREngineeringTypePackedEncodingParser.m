@implementation _XREngineeringTypePackedEncodingParser

+ (id)_elementNameToClassMap
{
  if (qword_25583C828 != -1)
    dispatch_once(&qword_25583C828, &unk_24EDC4230);
  return (id)qword_25583C820;
}

- (void)_handleStart
{
  XREngineeringTypeBitpackedEncodingConvention *v3;
  XREngineeringTypeBitpackedEncodingConvention *convention;

  v3 = (XREngineeringTypeBitpackedEncodingConvention *)objc_opt_new();
  convention = self->_convention;
  self->_convention = v3;

}

- (void)_handleCompletion
{
  XRXMLElementParser *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = self->super.parent->parent;
  objc_msgSend_convention(self, v4, v5, v6, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEncodingConvention_(v3, v8, (uint64_t)v11, v9, v10);

}

- (XREngineeringTypeBitpackedEncodingConvention)convention
{
  return self->_convention;
}

- (void)setConvention:(id)a3
{
  objc_storeStrong((id *)&self->_convention, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convention, 0);
}

@end
