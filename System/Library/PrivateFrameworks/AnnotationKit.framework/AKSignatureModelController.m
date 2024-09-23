@implementation AKSignatureModelController

- (AKSignatureModelController)initWithController:(id)a3
{
  id v4;
  AKSignatureModelController *v5;
  AKSignatureModelController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKSignatureModelController;
  v5 = -[AKSignatureModelController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AKSignatureModelController setController:](v5, "setController:", v4);

  return v6;
}

- (void)insertObject:(id)a3 inSignaturesAtIndex:(unint64_t)a4
{
  NSMutableArray *signatures;
  id v7;

  signatures = self->_signatures;
  v7 = a3;
  -[NSMutableArray insertObject:atIndex:](signatures, "insertObject:atIndex:", v7, a4);
  -[AKSignatureModelController _saveSignatureToPersistentStorage:](self, "_saveSignatureToPersistentStorage:", v7);

}

- (void)removeObjectFromSignaturesAtIndex:(unint64_t)a3
{
  id v5;

  -[NSMutableArray objectAtIndex:](self->_signatures, "objectAtIndex:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_signatures, "removeObjectAtIndex:", a3);
  -[AKSignatureModelController _deleteSignatureFromKeychain:](self, "_deleteSignatureFromKeychain:", v5);

}

- (NSArray)signatures
{
  NSMutableArray *signatures;
  NSMutableArray *v4;
  NSMutableArray *v5;

  signatures = self->_signatures;
  if (!signatures)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->_signatures;
    self->_signatures = v4;

    -[AKSignatureModelController _loadSignaturesFromPersistentStorage](self, "_loadSignaturesFromPersistentStorage");
    signatures = self->_signatures;
  }
  return (NSArray *)signatures;
}

- (void)reloadSignaturesFromSource
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, -[NSMutableArray count](self->_signatures, "count"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    -[AKSignatureModelController willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 3, v3, CFSTR("signatures"));
  -[NSMutableArray removeAllObjects](self->_signatures, "removeAllObjects");
  if (objc_msgSend(v3, "count"))
    -[AKSignatureModelController didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3, v3, CFSTR("signatures"));
  -[AKSignatureModelController _loadSignaturesFromPersistentStorage](self, "_loadSignaturesFromPersistentStorage");

}

- (void)_loadSignaturesFromPersistentStorage
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  OSStatus v9;
  CFIndex v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  AKSignatureModelController *v22;
  uint64_t v23;
  CFIndex Count;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFDictionary *v29;
  CFTypeRef v30;
  CFTypeRef result;
  _QWORD v32[6];
  _QWORD v33[8];

  v33[6] = *MEMORY[0x24BDAC8D0];
  result = 0;
  v3 = *MEMORY[0x24BDE9230];
  v4 = *MEMORY[0x24BDE94C0];
  v28 = *MEMORY[0x24BDE9220];
  v32[0] = *MEMORY[0x24BDE9220];
  v32[1] = v4;
  v26 = v4;
  v5 = *MEMORY[0x24BDBD270];
  v27 = v3;
  v33[0] = v3;
  v33[1] = v5;
  v6 = *MEMORY[0x24BDE9140];
  v32[2] = *MEMORY[0x24BDE8F50];
  v32[3] = v6;
  v33[2] = CFSTR("com.apple.AnnotationKit");
  v33[3] = v5;
  v7 = *MEMORY[0x24BDE93B0];
  v32[4] = *MEMORY[0x24BDE9128];
  v32[5] = v7;
  v25 = v7;
  v8 = *MEMORY[0x24BDE93B8];
  v33[4] = CFSTR("Signature Annotation Privacy Service");
  v33[5] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 6);
  v29 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v9 = SecItemCopyMatching(v29, &result);
  if (v9 == -25300)
  {
    NSLog(CFSTR("No items found in keychain"));
  }
  else if (v9)
  {
    NSLog(CFSTR("SecItemCopyMatching() returned error %ld: %@"), v9, &stru_24F1A83D0);
  }
  else
  {
    v22 = self;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    Count = CFArrayGetCount((CFArrayRef)result);
    if (Count >= 1)
    {
      v10 = 0;
      v11 = *MEMORY[0x24BDE8FA8];
      v12 = *MEMORY[0x24BDE94C8];
      v13 = *MEMORY[0x24BDE93C0];
      v23 = *MEMORY[0x24BDE9550];
      do
      {
        v14 = (void *)objc_msgSend((id)CFArrayGetValueAtIndex((CFArrayRef)result, v10), "mutableCopy");
        objc_msgSend(v14, "objectForKey:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v29);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeObjectForKey:", v26);
        objc_msgSend(v16, "setObject:forKey:", v5, v12);
        objc_msgSend(v16, "setObject:forKey:", v13, v25);
        objc_msgSend(v16, "setObject:forKey:", v27, v28);
        objc_msgSend(v16, "setValue:forKey:", v15, v11);
        v30 = 0;
        if (SecItemCopyMatching((CFDictionaryRef)v16, &v30))
        {
          NSLog(CFSTR("SecItemCopyMatching() returned error %ld: %@"), 0, &stru_24F1A83D0);
        }
        else
        {
          v17 = (void *)v30;
          if (v30)
          {
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedData:options:", v30, 0);
            objc_msgSend(v14, "setValue:forKey:", v18, v23);

            if (v18)
            {
              -[AKSignatureModelController _createAKSignatureFromItemRef:](v22, "_createAKSignatureFromItemRef:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
                objc_msgSend(v21, "addObject:", v19);

            }
          }
        }

        ++v10;
      }
      while (Count != v10);
    }
    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v21, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "count"))
        -[AKSignatureModelController willChange:valuesAtIndexes:forKey:](v22, "willChange:valuesAtIndexes:forKey:", 2, v20, CFSTR("signatures"));
      -[NSMutableArray addObjectsFromArray:](v22->_signatures, "addObjectsFromArray:", v21);
      if (objc_msgSend(v20, "count"))
        -[AKSignatureModelController didChange:valuesAtIndexes:forKey:](v22, "didChange:valuesAtIndexes:forKey:", 2, v20, CFSTR("signatures"));

    }
    CFRelease(result);

  }
}

- (void)_saveSignatureToPersistentStorage:(id)a3
{
  if (a3)
    MEMORY[0x24BEDD108](self, sel__createNewKeychainItemWithSignature_);
}

- (BOOL)_deleteSignatureFromKeychain:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  OSStatus v14;
  BOOL v15;
  CFTypeRef result;
  uint64_t v18;
  CFTypeRef v19;
  _QWORD v20[7];
  _QWORD v21[8];

  v21[7] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDE9230];
  v4 = *MEMORY[0x24BDE94D0];
  v20[0] = *MEMORY[0x24BDE9220];
  v20[1] = v4;
  v5 = *MEMORY[0x24BDBD270];
  v6 = *MEMORY[0x24BDE8F50];
  v20[2] = *MEMORY[0x24BDE9128];
  v20[3] = v6;
  v21[0] = v3;
  v21[1] = v5;
  v21[2] = CFSTR("Signature Annotation Privacy Service");
  v21[3] = CFSTR("com.apple.AnnotationKit");
  v7 = *MEMORY[0x24BDE9140];
  v21[4] = v5;
  v8 = *MEMORY[0x24BDE8FA8];
  v20[4] = v7;
  v20[5] = v8;
  objc_msgSend(a3, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = *MEMORY[0x24BDE93B0];
  v11 = *MEMORY[0x24BDE93C0];
  v21[5] = v10;
  v21[6] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  result = 0;
  SecItemCopyMatching(v12, &result);
  if (result)
  {
    v18 = *MEMORY[0x24BDE9558];
    v19 = result;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = SecItemDelete(v13);
    v15 = v14 == 0;
    if (v14)
      NSLog(CFSTR("SecItemDelete() returned error %ld: %@"), v14, &stru_24F1A83D0);

  }
  else
  {
    NSLog(CFSTR("SecItemCopyMatching() returned empty identityRef"));
    v15 = 0;
  }

  return v15;
}

- (BOOL)_createNewKeychainItemWithSignature:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFDictionary *v18;
  OSStatus v19;
  uint64_t v21;
  CFTypeRef result;
  id v23;
  _QWORD v24[8];
  _QWORD v25[10];

  v25[8] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x22E2C10E4]();
    v23 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v23);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v23;
    v7 = v6;
    if (v6)
      NSLog(CFSTR("Failed to encode AKSignature (%@)"), v6);
    objc_msgSend(v5, "base64EncodedDataWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "length"))
    {
      v10 = *MEMORY[0x24BDE9230];
      v11 = *MEMORY[0x24BDE9128];
      v24[0] = *MEMORY[0x24BDE9220];
      v24[1] = v11;
      v25[0] = v10;
      v25[1] = CFSTR("Signature Annotation Privacy Service");
      v12 = *MEMORY[0x24BDE8F50];
      v24[2] = *MEMORY[0x24BDE90A0];
      v24[3] = v12;
      v25[2] = CFSTR("Signature Annotation Privacy");
      v25[3] = CFSTR("com.apple.AnnotationKit");
      v25[4] = *MEMORY[0x24BDBD270];
      v13 = *MEMORY[0x24BDE8FD8];
      v24[4] = *MEMORY[0x24BDE9140];
      v24[5] = v13;
      +[AKController akBundle](AKController, "akBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Signatures for AnnotationKit (shared by e.g. Markup & Preview). Deletion will remove all signatures from the list."), &stru_24F1A83D0, CFSTR("AKSignatureModelController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[5] = v15;
      v24[6] = *MEMORY[0x24BDE8FA8];
      objc_msgSend(v3, "uniqueID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[7] = *MEMORY[0x24BDE9550];
      v25[6] = v17;
      v25[7] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 8);
      v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      result = 0;
      v19 = SecItemAdd(v18, &result);
      if (v19)
        NSLog(CFSTR("Couldn't add signature to keychain! (error %ld)"), v19);
      else
        NSLog(CFSTR("Successfully wrote signature to keychain"), v21);
      if (result)
        CFRelease(result);

    }
    else
    {
      NSLog(CFSTR("Couldn't add signature to keychain, because the encoded data was invalid."));
    }

    objc_autoreleasePoolPop(v4);
  }

  return 0;
}

- (id)_createAKSignatureFromItemRef:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDD1620];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, 0);

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD0E88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishDecoding");

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (AKSignature)selectedSignature
{
  return self->_selectedSignature;
}

- (void)setSelectedSignature:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSignature, a3);
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_selectedSignature, 0);
  objc_storeStrong((id *)&self->_signatures, 0);
}

@end
