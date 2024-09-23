@implementation _CHSRelevanceCacheBufChanges

- (uint64_t)changeTypeArchivedObjects
{
  if (result)
    return *(unsigned __int8 *)(result + 8);
  return result;
}

- (unsigned)replacementArchivedObjects
{
  if (a1)
    a1 = (unsigned int *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a1[3]);
  return a1;
}

- (uint64_t)changeTypeGroups
{
  if (result)
    return *(unsigned __int8 *)(result + 16);
  return result;
}

- (unsigned)replacementGroups
{
  if (a1)
    a1 = (unsigned int *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a1[5]);
  return a1;
}

- (void)replaceArchivedObjects:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeArchivedObjects = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 528, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementArchivedObjects = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitArchivedObjects
{
  self->_changeTypeArchivedObjects = 2;
}

- (void)preserveArchivedObjects
{
  self->_changeTypeArchivedObjects = 0;
}

- (void)replaceGroups:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeGroups = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 551, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementGroups = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitGroups
{
  self->_changeTypeGroups = 2;
}

- (void)preserveGroups
{
  self->_changeTypeGroups = 0;
}

@end
