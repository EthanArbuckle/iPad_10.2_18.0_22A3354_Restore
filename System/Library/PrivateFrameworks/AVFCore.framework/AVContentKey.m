@implementation AVContentKey

- (AVContentKey)initWithSpecifier:(id)a3 cryptor:(OpaqueFigCPECryptor *)a4 contentKeyBoss:(OpaqueFigContentKeyBoss *)a5 contentKeySpecifier:(OpaqueFigContentKeySpecifier *)a6
{
  AVContentKey *v10;
  OpaqueFigCPECryptor *v11;
  OpaqueFigContentKeySpecifier *v12;
  OpaqueFigContentKeyBoss *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVContentKey;
  v10 = -[AVContentKey init](&v15, sel_init);
  if (v10)
  {
    v10->contentKeySpecifier = (AVContentKeySpecifier *)objc_msgSend(a3, "copy");
    if (a4)
      v11 = (OpaqueFigCPECryptor *)CFRetain(a4);
    else
      v11 = 0;
    v10->_cryptor = v11;
    if (a6)
      v12 = (OpaqueFigContentKeySpecifier *)CFRetain(a6);
    else
      v12 = 0;
    v10->_contentKeySpecifier = v12;
    if (a5)
      v13 = (OpaqueFigContentKeyBoss *)CFRetain(a5);
    else
      v13 = 0;
    v10->_keyBoss = v13;
  }
  return v10;
}

- (void)dealloc
{
  OpaqueFigCPECryptor *cryptor;
  OpaqueFigContentKeyBoss *keyBoss;
  OpaqueFigContentKeySpecifier *contentKeySpecifier;
  objc_super v6;

  cryptor = self->_cryptor;
  if (cryptor)
    CFRelease(cryptor);
  keyBoss = self->_keyBoss;
  if (keyBoss)
    CFRelease(keyBoss);
  contentKeySpecifier = self->_contentKeySpecifier;
  if (contentKeySpecifier)
    CFRelease(contentKeySpecifier);

  v6.receiver = self;
  v6.super_class = (Class)AVContentKey;
  -[AVContentKey dealloc](&v6, sel_dealloc);
}

- (int64_t)externalContentProtectionStatus
{
  OpaqueFigContentKeyBoss *keyBoss;
  OpaqueFigContentKeySpecifier *contentKeySpecifier;
  _QWORD *v4;
  unsigned int (*v5)(OpaqueFigContentKeyBoss *, OpaqueFigContentKeySpecifier *, int *);
  int v7;

  v7 = 1;
  keyBoss = self->_keyBoss;
  contentKeySpecifier = self->_contentKeySpecifier;
  v4 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  v5 = (unsigned int (*)(OpaqueFigContentKeyBoss *, OpaqueFigContentKeySpecifier *, int *))v4[14];
  if (!v5 || *v4 < 3uLL || v5(keyBoss, contentKeySpecifier, &v7))
    return 0;
  if (v7 == 2)
    return 1;
  return 2 * (v7 == 3);
}

- (OpaqueFigContentKeySpecifier)_internalContentKeySpecifier
{
  return self->_contentKeySpecifier;
}

+ (AVContentKey)contentKeyWithSpecifier:(id)a3 cryptor:(OpaqueFigCPECryptor *)a4 contentKeyBoss:(OpaqueFigContentKeyBoss *)a5 contentKeySpecifier:(OpaqueFigContentKeySpecifier *)a6
{
  return -[AVContentKey initWithSpecifier:cryptor:contentKeyBoss:contentKeySpecifier:]([AVContentKey alloc], "initWithSpecifier:cryptor:contentKeyBoss:contentKeySpecifier:", a3, a4, a5, a6);
}

- (OpaqueFigCPECryptor)cryptor
{
  return self->_cryptor;
}

- (void)revoke
{
  OpaqueFigContentKeyBoss *keyBoss;
  OpaqueFigContentKeySpecifier *contentKeySpecifier;
  void (*v4)(OpaqueFigContentKeyBoss *, OpaqueFigContentKeySpecifier *);

  keyBoss = self->_keyBoss;
  contentKeySpecifier = self->_contentKeySpecifier;
  v4 = *(void (**)(OpaqueFigContentKeyBoss *, OpaqueFigContentKeySpecifier *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 128);
  if (v4)
    v4(keyBoss, contentKeySpecifier);
}

- (AVContentKeySpecifier)contentKeySpecifier
{
  return self->contentKeySpecifier;
}

@end
