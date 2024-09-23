@implementation _CHSExtensionIdentityBufChanges

- (uint64_t)changeTypeContainerBundleIdentifier
{
  if (result)
    return *(unsigned __int8 *)(result + 24);
  return result;
}

- (unsigned)replacementContainerBundleIdentifier
{
  if (a1)
    a1 = (unsigned int *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a1[7]);
  return a1;
}

- (uint64_t)changeTypeDeviceIdentifier
{
  if (result)
    return *(unsigned __int8 *)(result + 32);
  return result;
}

- (unsigned)replacementDeviceIdentifier
{
  if (a1)
    a1 = (unsigned int *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a1[9]);
  return a1;
}

- (void)replaceTokenString:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeTokenString = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 1014, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementTokenString = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitTokenString
{
  self->_changeTypeTokenString = 2;
}

- (void)preserveTokenString
{
  self->_changeTypeTokenString = 0;
}

- (void)replaceExtensionBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeExtensionBundleIdentifier = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 1037, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementExtensionBundleIdentifier = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitExtensionBundleIdentifier
{
  self->_changeTypeExtensionBundleIdentifier = 2;
}

- (void)preserveExtensionBundleIdentifier
{
  self->_changeTypeExtensionBundleIdentifier = 0;
}

- (void)replaceContainerBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeContainerBundleIdentifier = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 1060, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementContainerBundleIdentifier = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitContainerBundleIdentifier
{
  self->_changeTypeContainerBundleIdentifier = 2;
}

- (void)preserveContainerBundleIdentifier
{
  self->_changeTypeContainerBundleIdentifier = 0;
}

- (void)replaceDeviceIdentifier:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeDeviceIdentifier = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 1083, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementDeviceIdentifier = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitDeviceIdentifier
{
  self->_changeTypeDeviceIdentifier = 2;
}

- (void)preserveDeviceIdentifier
{
  self->_changeTypeDeviceIdentifier = 0;
}

@end
