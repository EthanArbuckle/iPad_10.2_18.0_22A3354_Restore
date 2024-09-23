@implementation _CHSIntentReferenceBufChanges

- (uint64_t)replacementStableHash
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)replaceStableHash:(int64_t)a3
{
  self->_changeTypeStableHash = 1;
  self->_replacementStableHash = a3;
}

- (void)omitStableHash
{
  self->_changeTypeStableHash = 2;
}

- (void)preserveStableHash
{
  self->_changeTypeStableHash = 0;
}

- (void)replaceIntentData:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeIntentData = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 2561, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementIntentData = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitIntentData
{
  self->_changeTypeIntentData = 2;
}

- (void)preserveIntentData
{
  self->_changeTypeIntentData = 0;
}

- (void)replaceSchemaData:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeSchemaData = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 2584, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementSchemaData = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitSchemaData
{
  self->_changeTypeSchemaData = 2;
}

- (void)preserveSchemaData
{
  self->_changeTypeSchemaData = 0;
}

- (void)replacePartialIntentData:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypePartialIntentData = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 2607, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementPartialIntentData = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitPartialIntentData
{
  self->_changeTypePartialIntentData = 2;
}

- (void)preservePartialIntentData
{
  self->_changeTypePartialIntentData = 0;
}

@end
