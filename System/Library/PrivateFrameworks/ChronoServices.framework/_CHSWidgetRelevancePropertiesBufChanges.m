@implementation _CHSWidgetRelevancePropertiesBufChanges

- (uint64_t)changeTypeRelevances
{
  if (result)
    return *(unsigned __int8 *)(result + 40);
  return result;
}

- (unsigned)replacementRelevances
{
  if (a1)
    a1 = (unsigned int *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a1[11]);
  return a1;
}

- (BOOL)replacementSupportsBackgroundRefresh
{
  if (result)
    return *(_BYTE *)(result + 25) != 0;
  return result;
}

- (uint64_t)changeTypeIsDeletion
{
  if (result)
    return *(unsigned __int8 *)(result + 26);
  return result;
}

- (BOOL)replacementIsDeletion
{
  if (result)
    return *(_BYTE *)(result + 27) != 0;
  return result;
}

- (uint64_t)changeTypeLastRelevanceUpdate
{
  if (result)
    return *(unsigned __int8 *)(result + 28);
  return result;
}

- (double)replacementLastRelevanceUpdate
{
  if (a1)
    return *(double *)(a1 + 32);
  else
    return 0.0;
}

- (void)replaceExtensionIdentity:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeExtensionIdentity = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 1562, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementExtensionIdentity = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitExtensionIdentity
{
  self->_changeTypeExtensionIdentity = 2;
}

- (void)preserveExtensionIdentity
{
  self->_changeTypeExtensionIdentity = 0;
}

- (void)replaceKind:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeKind = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 1585, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementKind = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitKind
{
  self->_changeTypeKind = 2;
}

- (void)preserveKind
{
  self->_changeTypeKind = 0;
}

- (void)replaceSupportsBackgroundRefresh:(BOOL)a3
{
  self->_changeTypeSupportsBackgroundRefresh = 1;
  self->_replacementSupportsBackgroundRefresh = a3;
}

- (void)omitSupportsBackgroundRefresh
{
  self->_changeTypeSupportsBackgroundRefresh = 2;
}

- (void)preserveSupportsBackgroundRefresh
{
  self->_changeTypeSupportsBackgroundRefresh = 0;
}

- (void)replaceIsDeletion:(BOOL)a3
{
  self->_changeTypeIsDeletion = 1;
  self->_replacementIsDeletion = a3;
}

- (void)omitIsDeletion
{
  self->_changeTypeIsDeletion = 2;
}

- (void)preserveIsDeletion
{
  self->_changeTypeIsDeletion = 0;
}

- (void)replaceLastRelevanceUpdate:(double)a3
{
  self->_changeTypeLastRelevanceUpdate = 1;
  self->_replacementLastRelevanceUpdate = a3;
}

- (void)omitLastRelevanceUpdate
{
  self->_changeTypeLastRelevanceUpdate = 2;
}

- (void)preserveLastRelevanceUpdate
{
  self->_changeTypeLastRelevanceUpdate = 0;
}

- (void)replaceRelevances:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeRelevances = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 1671, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementRelevances = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitRelevances
{
  self->_changeTypeRelevances = 2;
}

- (void)preserveRelevances
{
  self->_changeTypeRelevances = 0;
}

@end
