@implementation _CHSWidgetRelevanceBufChanges

- (void)replaceAttributeKey:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeAttributeKey = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 2014, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementAttributeKey = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitAttributeKey
{
  self->_changeTypeAttributeKey = 2;
}

- (void)preserveAttributeKey
{
  self->_changeTypeAttributeKey = 0;
}

- (void)replaceIntentReference:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeIntentReference = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 2037, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementIntentReference = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitIntentReference
{
  self->_changeTypeIntentReference = 2;
}

- (void)preserveIntentReference
{
  self->_changeTypeIntentReference = 0;
}

@end
