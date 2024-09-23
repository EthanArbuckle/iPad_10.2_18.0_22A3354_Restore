@implementation CNContactBufferDecoder

- (BOOL)decodeContactsFromBuffer:(id)a3 replyHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _BOOL8);
  id v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  int64_t state;
  BOOL v13;
  _BOOL8 v14;
  void *v15;
  id v16;
  BOOL v17;
  unint64_t v19;

  v6 = a3;
  v7 = (void (**)(id, void *, _BOOL8))a4;
  v8 = objc_retainAutorelease(v6);
  v19 = objc_msgSend(v8, "bytes");
  v9 = v19 + objc_msgSend(v8, "length");
  while (!self || self->_bytesNeededToResume < 1)
  {
    -[CNContactBufferDecoder _contactFromByteCursor:end:]((uint64_t)self, (uint64_t *)&v19, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v11;
    if (self)
      goto LABEL_6;
    v14 = v19 < v9;
    if (v11)
      goto LABEL_13;
LABEL_20:
    if (!v14)
      goto LABEL_25;
  }
  -[CNContactBufferDecoder completedPendingContactFromByteCursor:end:]((uint64_t)self, &v19, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  state = self->_state;
  if (state)
    v13 = 1;
  else
    v13 = v19 >= v9;
  v14 = !v13;
  if (v10)
  {
LABEL_13:
    -[CNContactBufferDecoder keyDescriptorToMakeAvailable](self, "keyDescriptorToMakeAvailable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAvailableKeyDescriptor:", v15);

    if (-[CNContactBufferDecoder mutableResults](self, "mutableResults"))
      objc_msgSend(v10, "setFrozenSelfAsSnapshot");
    else
      v16 = (id)objc_msgSend(v10, "freezeWithSelfAsSnapshot");
    v7[2](v7, v10, v14);

    goto LABEL_20;
  }
  if (state == 2)
  {
    v17 = 0;
    goto LABEL_26;
  }
  if (state != 1)
    goto LABEL_20;
  v7[2](v7, 0, 0);
LABEL_25:
  v17 = 1;
LABEL_26:

  return v17;
}

- (BOOL)mutableResults
{
  return self->_mutableResults;
}

- (CNContactKeyVector)keyDescriptorToMakeAvailable
{
  return self->_keyDescriptorToMakeAvailable;
}

- (id)_contactFromByteCursor:(unint64_t)a3 end:
{
  id v3;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v3 = 0;
  if (a1 && a2)
  {
    v6 = *a2;
    if (*a2)
      v7 = v6 >= a3;
    else
      v7 = 1;
    if (v7 || ((v8 = v6 + 13, *(_BYTE *)v6 == 1) ? (v9 = v8 > a3) : (v9 = 1), v9 || v8 + *(_QWORD *)(v6 + 5) > a3))
    {
      v3 = 0;
    }
    else
    {
      v12 = *(unsigned int *)(v6 + 1);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v6 + 13, *(_QWORD *)(v6 + 5), 4);
      +[CNContact contactWithIdentifier:](CNMutableContact, "contactWithIdentifier:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v14;

      objc_msgSend(*(id *)(a1 + 32), "setIOSLegacyIdentifier:", v12);
      v17 = *(_QWORD *)(v6 + 5) + v6 + 13;
      -[CNContactBufferDecoder _applyPropertiesFromFromByteCursor:end:](a1, (unint64_t *)&v17, a3);
      *a2 = v17;
      if (*(_QWORD *)(a1 + 24))
      {
        v3 = 0;
      }
      else
      {
        v3 = *(id *)(a1 + 32);
        v16 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = 0;

      }
    }
  }
  return v3;
}

- (void)_applyPropertiesFromFromByteCursor:(unint64_t)a3 end:
{
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  unint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v3 = a2;
  if (!a2)
    return;
  v4 = a3;
  v5 = *a2;
  if (!*a2 || v5 >= a3)
    return;
  v29 = *a2;
  v23 = a3;
  v24 = a2;
  while (2)
  {
    switch(*(_BYTE *)v5)
    {
      case 1:
        v22 = 0;
        goto LABEL_30;
      case 2:
        if (v5 + 13 > v4)
          goto LABEL_26;
        v8 = *(_QWORD *)(v5 + 5);
        if (v5 + 13 + v8 > v4)
          goto LABEL_26;
        v9 = *(unsigned int *)(v5 + 1);
        +[CNiOSABConversions contactPropertiesByABPropertyID]();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v26 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_msgSend(v18, "CNValueFromABBytes:length:", v5 + 13, v8, v23, v24);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setCNValue:onContact:", v19, *(_QWORD *)(a1 + 32));

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          }
          while (v15);
        }

        v29 += *(_QWORD *)(v5 + 5) + 13;
        v4 = v23;
        v3 = v24;
        goto LABEL_24;
      case 3:
        if (v5 + 5 > v4)
          goto LABEL_26;
        v20 = *(unsigned int *)(v5 + 1);
        v29 = v5 + 5;
        -[CNContactBufferDecoder _applyMultivalueFromByteCursor:end:abPropertyID:](a1, &v29, v4, v20);
        goto LABEL_24;
      case 6:
        v21 = v5 + 26;
        if (v5 + 26 > v4)
        {
LABEL_26:
          v22 = 2;
          goto LABEL_31;
        }
        if (v21 + *(_QWORD *)(v5 + 18) <= v4)
        {
          -[CNContactBufferDecoder _applyImageDataFromByteCursor:end:](a1, (uint64_t *)&v29, v4);
LABEL_24:
          v5 = v29;
          *v3 = v29;
          if (v5 >= v4)
          {
            v22 = 0;
            goto LABEL_31;
          }
          continue;
        }
        objc_msgSend(*(id *)(a1 + 40), "appendBytes:length:", v29, v4 - v29);
        *(_QWORD *)(a1 + 48) = v21 + *(_QWORD *)(v5 + 18) - v4;
        v22 = 1;
LABEL_30:
        *v3 = v29;
LABEL_31:
        *(_QWORD *)(a1 + 24) = v22;
        return;
      default:
        v22 = 2;
        goto LABEL_30;
    }
  }
}

- (void)_applyMultivalueFromByteCursor:(unint64_t)a3 end:(uint64_t)property abPropertyID:
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  ABPropertyType TypeOfProperty;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (a1 && a2 && *a2 && *a2 < a3)
  {
    v39 = *a2;
    TypeOfProperty = ABPersonGetTypeOfProperty(property);
    +[CNiOSABConversions contactPropertiesByABPropertyID]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = property;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", property);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v12)
    {
      v36 = a1;
      v13 = *(_QWORD *)v46;
      v14 = 0x1E0CB3000uLL;
      v38 = v11;
      v34 = *(_QWORD *)v46;
      while (2)
      {
        v15 = 0;
        v33 = v12;
        do
        {
          if (*(_QWORD *)v46 != v13)
          {
            v16 = v15;
            objc_enumerationMutation(v11);
            v15 = v16;
          }
          v35 = v15;
          v41 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v15);
          objc_msgSend(v41, "CNMutableValueForABMultivalue");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 0;
          v18 = v39;
          while (*(_BYTE *)v18 == 4)
          {
            if (v18 + 29 > a3 || v18 + 29 + *(_QWORD *)(v18 + 5) > a3)
            {
              *(_QWORD *)(v36 + 24) = 2;
LABEL_47:

              goto LABEL_48;
            }
            v19 = *(unsigned int *)(v18 + 1);
            v20 = (void *)objc_msgSend(objc_alloc(*(Class *)(v14 + 2368)), "initWithBytes:length:encoding:", v18 + 29, *(_QWORD *)(v18 + 5), 4);
            v21 = *(_QWORD *)(v18 + 5) + v18 + 29;
            v22 = *(_QWORD *)(v18 + 13);
            if (v21 + v22 > a3)
            {
              *(_QWORD *)(v36 + 24) = 2;
LABEL_46:

              goto LABEL_47;
            }
            if (v22)
              v44 = (void *)objc_msgSend(objc_alloc(*(Class *)(v14 + 2368)), "initWithBytes:length:encoding:", v21, *(_QWORD *)(v18 + 13), 4);
            else
              v44 = 0;
            v18 = v21 + *(_QWORD *)(v18 + 13) + *(_QWORD *)(v18 + 21);
            if (TypeOfProperty == 261)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18 < a3)
              {
                while (1)
                {
                  if (*(_BYTE *)v18 != 5)
                    goto LABEL_30;
                  v24 = v18 + 17;
                  if (v18 + 17 > a3 || v24 + *(_QWORD *)(v18 + 1) > a3)
                    break;
                  v25 = (void *)objc_msgSend(objc_alloc(*(Class *)(v14 + 2368)), "initWithBytes:length:encoding:", v18 + 17, *(_QWORD *)(v18 + 1), 4);
                  v26 = v14;
                  v27 = v25;
                  v28 = v24 + *(_QWORD *)(v18 + 1);
                  if (v28 + *(_QWORD *)(v18 + 9) > a3)
                  {
                    *(_QWORD *)(v36 + 24) = 2;

                    goto LABEL_44;
                  }
                  v29 = v26;
                  v30 = (void *)objc_msgSend(objc_alloc(*(Class *)(v26 + 2368)), "initWithBytes:length:encoding:", v28, *(_QWORD *)(v18 + 9), 4);
                  v31 = *(_QWORD *)(v18 + 9);
                  if (v27)
                    objc_msgSend(v23, "setObject:forKey:", v30, v27);
                  else
                    NSLog(CFSTR("Missing dictionary key for property %d"), v40);
                  v18 = v28 + v31;

                  v14 = v29;
                  if (v18 >= a3)
                    goto LABEL_30;
                }
                *(_QWORD *)(v36 + 24) = 2;
LABEL_44:

                v11 = v38;
                goto LABEL_45;
              }
LABEL_30:
              v32 = v44;
              v17 |= objc_msgSend(v41, "applyDictionary:identifier:legacyIdentifier:label:toCNMultivalueRepresentation:", v23, v20, v19, v44, v43);

              v11 = v38;
            }
            else
            {
              if (v18 > a3)
              {
                *(_QWORD *)(v36 + 24) = 2;
LABEL_45:

                goto LABEL_46;
              }
              v32 = v44;
              v17 |= objc_msgSend(v41, "applyABMultivalueValueBytes:length:identifier:legacyIdentifier:label:toCNMultivalueRepresentation:");
            }

            if (v18 >= a3)
              break;
          }
          if ((v17 & 1) != 0)
            objc_msgSend(v41, "setCNValue:onContact:", v43, *(_QWORD *)(v36 + 32));

          v13 = v34;
          v15 = v35 + 1;
        }
        while (v35 + 1 != v33);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        v13 = v34;
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v18 = v39;
    }

    *a2 = v18;
LABEL_48:

  }
}

- (CNContactBufferDecoder)initWithKeyDescriptorToMakeAvailable:(id)a3 mutableResults:(BOOL)a4
{
  id v6;
  CNContactBufferDecoder *v7;
  uint64_t v8;
  CNContactKeyVector *keyDescriptorToMakeAvailable;
  uint64_t v10;
  NSMutableData *resumeBuffer;
  CNContactBufferDecoder *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNContactBufferDecoder;
  v7 = -[CNContactBufferDecoder init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    keyDescriptorToMakeAvailable = v7->_keyDescriptorToMakeAvailable;
    v7->_keyDescriptorToMakeAvailable = (CNContactKeyVector *)v8;

    v7->_state = 0;
    v7->_mutableResults = a4;
    v10 = objc_opt_new();
    resumeBuffer = v7->_resumeBuffer;
    v7->_resumeBuffer = (NSMutableData *)v10;

    v12 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resumeBuffer, 0);
  objc_storeStrong((id *)&self->_pendingContact, 0);
  objc_storeStrong((id *)&self->_keyDescriptorToMakeAvailable, 0);
}

- (void)_applyImageDataFromByteCursor:(unint64_t)a3 end:
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = *a2;
    v7 = *a2 + 26;
    if (v7 > a3)
    {
LABEL_7:
      *(_QWORD *)(a1 + 24) = 2;
      return;
    }
    if (*(_BYTE *)(v6 + 1))
      objc_msgSend(*(id *)(a1 + 32), "setCropRect:", (double)*(int *)(v6 + 2), (double)*(int *)(v6 + 6), (double)*(int *)(v6 + 10), (double)*(int *)(v6 + 10));
    v8 = *(_QWORD *)(v6 + 18);
    if (v8)
    {
      if (v7 + v8 > a3)
        goto LABEL_7;
      ABOSLogImageMetadata();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_DWORD *)(v6 + 14);
        v12 = *(_QWORD *)(v6 + 18);
        v14[0] = 67109376;
        v14[1] = v11;
        v15 = 2048;
        v16 = v12;
        _os_log_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_DEFAULT, "[CNContactBufferDecoder _applyImageDataFromByteCursor:end:] reading image format %d of length %lu into NSData", (uint8_t *)v14, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, *(_QWORD *)(v6 + 18));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      switch(*(_DWORD *)(v6 + 14))
      {
        case 0:
          objc_msgSend(*(id *)(a1 + 32), "setThumbnailImageData:", v13);
          break;
        case 2:
          objc_msgSend(*(id *)(a1 + 32), "setImageData:", v13);
          break;
        case 4:
          objc_msgSend(*(id *)(a1 + 32), "setFullscreenImageData:", v13);
          break;
        case 5:
          objc_msgSend(*(id *)(a1 + 32), "setSyncImageData:", v13);
          break;
        default:
          break;
      }

      v9 = *(_QWORD *)(v6 + 18) + 26;
    }
    else
    {
      v9 = 26;
    }
    *a2 += v9;
  }
}

- (BOOL)hasPendingContacts
{
  return self->_pendingContact != 0;
}

- (id)completedPendingContactFromByteCursor:(unint64_t)a3 end:
{
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v13;
  void *v14;
  uint64_t v15;

  if (!a1)
    return 0;
  v8 = a1 + 40;
  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(v8 + 8);
  v9 = a3 - *a2 >= v7 ? v7 : a3 - *a2;
  objc_msgSend(v6, "appendBytes:length:");
  *a2 += v9;
  v10 = *(_QWORD *)(a1 + 48) - v9;
  *(_QWORD *)(a1 + 48) = v10;
  if (v10)
    return 0;
  *(_QWORD *)(a1 + 24) = 0;
  v15 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
  v11 = v15 + objc_msgSend(*(id *)(a1 + 40), "length");
  -[CNContactBufferDecoder _applyPropertiesFromFromByteCursor:end:](a1, (unint64_t *)&v15, v11);
  objc_msgSend(*(id *)(a1 + 40), "setLength:", 0);
  if (v15 != v11)
  {
    *(_QWORD *)(a1 + 24) = 2;
    return 0;
  }
  -[CNContactBufferDecoder _applyPropertiesFromFromByteCursor:end:](a1, a2, a3);
  if (*(_QWORD *)(a1 + 24))
    return 0;
  v13 = *(id *)(a1 + 32);
  v14 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;

  return v13;
}

- (void)setMutableResults:(BOOL)a3
{
  self->_mutableResults = a3;
}

- (void)setKeyDescriptorToMakeAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
