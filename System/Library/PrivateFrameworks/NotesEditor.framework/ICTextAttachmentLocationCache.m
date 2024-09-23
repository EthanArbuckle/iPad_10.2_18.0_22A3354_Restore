@implementation ICTextAttachmentLocationCache

- (NSMutableDictionary)locationByTextAttachmentIdentifier
{
  NSMutableDictionary *locationByTextAttachmentIdentifier;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  locationByTextAttachmentIdentifier = self->_locationByTextAttachmentIdentifier;
  if (!locationByTextAttachmentIdentifier)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_locationByTextAttachmentIdentifier;
    self->_locationByTextAttachmentIdentifier = v4;

    locationByTextAttachmentIdentifier = self->_locationByTextAttachmentIdentifier;
  }
  return locationByTextAttachmentIdentifier;
}

- (ICTextAttachmentLocationCache)initWithLayoutManager:(id)a3 cachedTextAttachmentType:(Class)a4
{
  id v6;
  ICTextAttachmentLocationCache *v7;
  ICTextAttachmentLocationCache *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICTextAttachmentLocationCache;
  v7 = -[ICTextAttachmentLocationCache init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_layoutManager, v6);
    v8->_previousScanHaltLocation = 0;
    objc_storeStrong((id *)&v8->_cachedTextAttachmentType, a4);
  }

  return v8;
}

- (unint64_t)locationForTextAttachmentOfViewIdentifier:(id)a3
{
  return -[ICTextAttachmentLocationCache locationForTextAttachmentOfViewIdentifier:keyExistsBeforeEnumeration:validationSuccessful:stepsOfEnumeration:](self, "locationForTextAttachmentOfViewIdentifier:keyExistsBeforeEnumeration:validationSuccessful:stepsOfEnumeration:", a3, 0, 0, 0);
}

- (unint64_t)locationForTextAttachmentOfViewIdentifier:(id)a3 keyExistsBeforeEnumeration:(BOOL *)a4 validationSuccessful:(BOOL *)a5 stepsOfEnumeration:(unint64_t *)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v10 = a3;
  v11 = v10;
  if (v10)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__16;
    v33 = __Block_byref_object_dispose__16;
    v12 = v10;
    v34 = v12;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__16;
    v27 = __Block_byref_object_dispose__16;
    -[ICTextAttachmentLocationCache locationByTextAttachmentIdentifier](self, "locationByTextAttachmentIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v30[5]);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    v14 = v24;
    if (a4)
      *a4 = v24[5] != 0;
    v15 = (void *)v14[5];
    if (v15)
    {
      v16 = objc_msgSend(v15, "unsignedIntegerValue");
      if (!-[ICTextAttachmentLocationCache validateLocation:againstViewIdentifier:](self, "validateLocation:againstViewIdentifier:", v16, v30[5]))
      {
        -[ICTextAttachmentLocationCache locationByTextAttachmentIdentifier](self, "locationByTextAttachmentIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObjectForKey:", v12);

        v18 = (void *)v24[5];
        v24[5] = 0;

      }
    }
    if (a5)
      *a5 = v24[5] != 0;
    if (a6)
      *a6 = 0;
    v19 = (void *)v24[5];
    if (v19)
      goto LABEL_13;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __142__ICTextAttachmentLocationCache_locationForTextAttachmentOfViewIdentifier_keyExistsBeforeEnumeration_validationSuccessful_stepsOfEnumeration___block_invoke;
    v22[3] = &unk_1EA7E0688;
    v22[4] = self;
    v22[5] = &v23;
    v22[6] = &v29;
    v22[7] = a6;
    -[ICTextAttachmentLocationCache enumerateTextAttachmentsInRangeUsingBlock:](self, "enumerateTextAttachmentsInRangeUsingBlock:", v22);
    v19 = (void *)v24[5];
    if (v19)
LABEL_13:
      v20 = objc_msgSend(v19, "unsignedIntegerValue");
    else
      v20 = 0x7FFFFFFFFFFFFFFFLL;
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v20 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v20;
}

void __142__ICTextAttachmentLocationCache_locationForTextAttachmentOfViewIdentifier_keyExistsBeforeEnumeration_validationSuccessful_stepsOfEnumeration___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v8 = *(_QWORD **)(a1 + 56);
  if (v8)
    ++*v8;
  objc_msgSend(*(id *)(a1 + 32), "cachedTextAttachmentType");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "locationByTextAttachmentIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v10);

    }
    objc_msgSend(*(id *)(a1 + 32), "locationByTextAttachmentIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      *a5 = 1;

  }
}

- (BOOL)validateLocation:(unint64_t)a3 againstViewIdentifier:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && v6)
  {
    -[ICTextAttachmentLocationCache layoutManager](self, "layoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11 <= a3)
    {
      v8 = 0;
    }
    else
    {
      -[ICTextAttachmentLocationCache layoutManager](self, "layoutManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], a3, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTextAttachmentLocationCache cachedTextAttachmentType](self, "cachedTextAttachmentType");
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        ICCheckedDynamicCast();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "viewIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", v16);

      }
      else
      {
        v8 = 0;
      }

    }
  }

  return v8;
}

- (void)setLocation:(unint64_t)a3 forTextAttachmentOfViewIdentifier:(id)a4
{
  void *v7;
  id v8;
  void *v9;
  id v10;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = a4;
    objc_msgSend(v7, "numberWithUnsignedInteger:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[ICTextAttachmentLocationCache locationByTextAttachmentIdentifier](self, "locationByTextAttachmentIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v8);

  }
}

- (void)forgetLocationForViewIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    -[ICTextAttachmentLocationCache locationByTextAttachmentIdentifier](self, "locationByTextAttachmentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(v6, "unsignedIntegerValue");
      -[ICTextAttachmentLocationCache layoutManager](self, "layoutManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 >= objc_msgSend(v9, "length"))
        v10 = 0;
      else
        v10 = objc_msgSend(v6, "unsignedIntegerValue");
      -[ICTextAttachmentLocationCache setPreviousScanHaltLocation:](self, "setPreviousScanHaltLocation:", v10);

      -[ICTextAttachmentLocationCache locationByTextAttachmentIdentifier](self, "locationByTextAttachmentIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v12);

    }
    v4 = v12;
  }

}

- (void)clear
{
  id v3;

  -[ICTextAttachmentLocationCache setPreviousScanHaltLocation:](self, "setPreviousScanHaltLocation:", 0);
  -[ICTextAttachmentLocationCache locationByTextAttachmentIdentifier](self, "locationByTextAttachmentIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (unint64_t)nextLocationForRange:(_NSRange)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL || a3.length == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v5 = a3.location + a3.length;
  -[ICTextAttachmentLocationCache layoutManager](self, "layoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v5 >= v8)
    return 0;
  else
    return v5;
}

- (void)enumerateTextAttachmentsInRangeUsingBlock:(id)a3
{
  -[ICTextAttachmentLocationCache enumerateTextAttachmentsInRangeWithFirstEnumerateRangeResult:secondEnumerateRangeResult:usingBlock:](self, "enumerateTextAttachmentsInRangeWithFirstEnumerateRangeResult:secondEnumerateRangeResult:usingBlock:", 0, 0, a3);
}

- (void)enumerateTextAttachmentsInRangeWithFirstEnumerateRangeResult:(_NSRange *)a3 secondEnumerateRangeResult:(_NSRange *)a4 usingBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSUInteger v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, uint64_t, _BYTE *);
  void *v23;
  ICTextAttachmentLocationCache *v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v8 = a5;
  if (v8)
  {
    -[ICTextAttachmentLocationCache layoutManager](self, "layoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v31 = -[ICTextAttachmentLocationCache previousScanHaltLocation](self, "previousScanHaltLocation");
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __132__ICTextAttachmentLocationCache_enumerateTextAttachmentsInRangeWithFirstEnumerateRangeResult_secondEnumerateRangeResult_usingBlock___block_invoke;
    v23 = &unk_1EA7E06B0;
    v26 = &v32;
    v27 = &v28;
    v24 = self;
    v25 = v8;
    v12 = _Block_copy(&v20);
    if (-[ICTextAttachmentLocationCache previousScanHaltLocation](self, "previousScanHaltLocation", v20, v21, v22, v23) < v11)
    {
      v13 = -[ICTextAttachmentLocationCache previousScanHaltLocation](self, "previousScanHaltLocation");
      v14 = v11 - -[ICTextAttachmentLocationCache previousScanHaltLocation](self, "previousScanHaltLocation");
      if (a3)
      {
        a3->location = v13;
        a3->length = v14;
      }
      -[ICTextAttachmentLocationCache layoutManager](self, "layoutManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textStorage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", *MEMORY[0x1E0DC10F8], v13, v14, 0, v12);

    }
    if (!*((_BYTE *)v33 + 24))
    {
      v17 = -[ICTextAttachmentLocationCache previousScanHaltLocation](self, "previousScanHaltLocation");
      if (v17 < v11)
        v11 = v17;
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a4)
        {
          a4->location = 0;
          a4->length = v11;
        }
        -[ICTextAttachmentLocationCache layoutManager](self, "layoutManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "textStorage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", *MEMORY[0x1E0DC10F8], 0, v11, 0, v12);

      }
    }
    -[ICTextAttachmentLocationCache setPreviousScanHaltLocation:](self, "setPreviousScanHaltLocation:", v29[3]);

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }

}

void __132__ICTextAttachmentLocationCache_enumerateTextAttachmentsInRangeWithFirstEnumerateRangeResult_secondEnumerateRangeResult_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v9 = a2;
  v10 = *(_QWORD *)(a1 + 40);
  v12 = v9;
  if (v10)
  {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t, _BYTE *))(v10 + 16))(v10, v9, a3, a4, a5);
    v9 = v12;
  }
  if (*a5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v11 = objc_msgSend(*(id *)(a1 + 32), "nextLocationForRange:", a3, a4);
    v9 = v12;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11;
  }

}

- (unint64_t)previousScanHaltLocation
{
  return self->_previousScanHaltLocation;
}

- (void)setPreviousScanHaltLocation:(unint64_t)a3
{
  self->_previousScanHaltLocation = a3;
}

- (ICLayoutManager)layoutManager
{
  return (ICLayoutManager *)objc_loadWeakRetained((id *)&self->_layoutManager);
}

- (void)setLayoutManager:(id)a3
{
  objc_storeWeak((id *)&self->_layoutManager, a3);
}

- (Class)cachedTextAttachmentType
{
  return self->_cachedTextAttachmentType;
}

- (void)setCachedTextAttachmentType:(Class)a3
{
  objc_storeStrong((id *)&self->_cachedTextAttachmentType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTextAttachmentType, 0);
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_storeStrong((id *)&self->_locationByTextAttachmentIdentifier, 0);
}

@end
