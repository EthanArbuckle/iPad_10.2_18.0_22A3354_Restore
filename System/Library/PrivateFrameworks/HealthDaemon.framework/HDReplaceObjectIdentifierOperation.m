@implementation HDReplaceObjectIdentifierOperation

- (HDReplaceObjectIdentifierOperation)initWithWithObjectIdentifier:(id)a3 replacementIdentifier:(id)a4 schemaIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDReplaceObjectIdentifierOperation *v11;
  uint64_t v12;
  NSString *objectIdentifier;
  uint64_t v14;
  NSString *replacementIdentifier;
  uint64_t v16;
  NSString *schemaIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDReplaceObjectIdentifierOperation;
  v11 = -[HDReplaceObjectIdentifierOperation init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    objectIdentifier = v11->_objectIdentifier;
    v11->_objectIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    replacementIdentifier = v11->_replacementIdentifier;
    v11->_replacementIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    schemaIdentifier = v11->_schemaIdentifier;
    v11->_schemaIdentifier = (NSString *)v16;

  }
  return v11;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSString *objectIdentifier;
  NSString *schemaIdentifier;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objectIdentifier = self->_objectIdentifier;
  schemaIdentifier = self->_schemaIdentifier;
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __75__HDReplaceObjectIdentifierOperation_performWithProfile_transaction_error___block_invoke;
  v26[3] = &unk_1E6CF27E8;
  v12 = v8;
  v27 = v12;
  if (+[HDAttachmentReferenceEntity enumerateReferencesForObjectIdentifier:schemaIdentifier:transaction:error:enumerationHandler:](HDAttachmentReferenceEntity, "enumerateReferencesForObjectIdentifier:schemaIdentifier:transaction:error:enumerationHandler:", objectIdentifier, schemaIdentifier, v7, a5, v26)&& +[HDAttachmentReferenceEntity deleteReferences:cloudStatus:transaction:error:](HDAttachmentReferenceEntity, "deleteReferences:cloudStatus:transaction:error:", v12, 0, v7, a5))
  {
    v25[0] = v11;
    v25[1] = 3221225472;
    v25[2] = __75__HDReplaceObjectIdentifierOperation_performWithProfile_transaction_error___block_invoke_2;
    v25[3] = &unk_1E6D0CA40;
    v25[4] = self;
    objc_msgSend(v12, "hk_map:", v25);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          +[HDAttachmentReferenceEntity _insertReference:databaseTransaction:error:](HDAttachmentReferenceEntity, "_insertReference:databaseTransaction:error:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), v7, a5, (_QWORD)v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            v19 = 0;
            goto LABEL_14;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
        if (v15)
          continue;
        break;
      }
    }
    v19 = 1;
LABEL_14:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __75__HDReplaceObjectIdentifierOperation_performWithProfile_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

uint64_t __75__HDReplaceObjectIdentifierOperation_performWithProfile_transaction_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "referenceWithObjectIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDReplaceObjectIdentifierOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HDReplaceObjectIdentifierOperation *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("object_identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replacement_identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("schema_identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HDReplaceObjectIdentifierOperation initWithWithObjectIdentifier:replacementIdentifier:schemaIdentifier:](self, "initWithWithObjectIdentifier:replacementIdentifier:schemaIdentifier:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDReplaceObjectIdentifierOperation;
  v4 = a3;
  -[HDJournalEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectIdentifier, CFSTR("object_identifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_replacementIdentifier, CFSTR("replacement_identifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_schemaIdentifier, CFSTR("schema_identifier"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaIdentifier, 0);
  objc_storeStrong((id *)&self->_replacementIdentifier, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end
