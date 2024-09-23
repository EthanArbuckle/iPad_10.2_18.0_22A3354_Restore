@implementation FCCKAESSIVRecordNameCipher

- (id)encryptRecordName:(id)a3 withKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = 0;
  if (v6 && a4)
  {
    -[FCCKAESSIVRecordNameCipher _derivedKeyFromKey:]((uint64_t)self, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[FCCKAESSIVRecordNameCipher _encryptionSalt](self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fc_encryptAESSIVWithKey:additionalData:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)_derivedKeyFromKey:(uint64_t)a1
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  if (!a1)
    goto LABEL_4;
  v2 = (void *)MEMORY[0x1E0C99DF0];
  v3 = a2;
  objc_msgSend(v2, "dataWithLength:", 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ccsha512_di();
  objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  objc_msgSend(v5, "bytes");

  objc_msgSend(v4, "length");
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v6, "mutableBytes");
  if (cchkdf())
  {

LABEL_4:
    v6 = 0;
  }
  return v6;
}

- (id)_encryptionSalt
{
  if (a1)
  {
    if (qword_1ED0F7F28 != -1)
      dispatch_once(&qword_1ED0F7F28, &__block_literal_global_38);
    a1 = (id)_MergedGlobals_152;
  }
  return a1;
}

- (id)decryptRecordName:(id)a3 withKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = 0;
  if (v6 && a4)
  {
    -[FCCKAESSIVRecordNameCipher _derivedKeyFromKey:]((uint64_t)self, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[FCCKAESSIVRecordNameCipher _encryptionSalt](self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
      objc_msgSend(v10, "fc_decryptAESSIVWithKey:additionalData:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
      else
        v7 = 0;

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

void __45__FCCKAESSIVRecordNameCipher__encryptionSalt__block_invoke()
{
  uint64_t v0;
  void *v1;
  __int128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2 = xmmword_1A1E82370;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v2, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_152;
  _MergedGlobals_152 = v0;

}

@end
