@implementation CSSearchableItemCodedArray

- (CSSearchableItemCodedArray)initWithItems:(id)a3
{
  id v5;
  CSSearchableItemCodedArray *v6;
  CSSearchableItemCodedArray *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSSearchableItemCodedArray;
  v6 = -[CSSearchableItemCodedArray init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_items, a3);

  return v7;
}

- (CSSearchableItemCodedArray)initWithItems:(id)a3 itemsContent:(id)a4
{
  id v7;
  id v8;
  CSSearchableItemCodedArray *v9;
  CSSearchableItemCodedArray *v10;
  __int128 v11;
  $37FF168C8709F524D812460C59637AB1 v12;
  __int128 v13;
  __int128 v15;
  $37FF168C8709F524D812460C59637AB1 v16;

  v7 = a3;
  v8 = a4;
  v9 = -[CSSearchableItemCodedArray initWithItems:](self, "initWithItems:", v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_items, a3);
    if (v8)
    {
      objc_msgSend(v8, "obj");
      if (_MDPlistGetPlistObjectType() == 240)
      {
        objc_msgSend(v8, "obj");
        if (_MDPlistArrayGetCount() == 2)
        {
          objc_msgSend(v8, "obj");
          _MDPlistArrayGetPlistObjectAtIndex();
          if (_MDPlistGetPlistObjectType() == 244
            || (objc_msgSend(v8, "obj"),
                _MDPlistArrayGetPlistObjectAtIndex(),
                _MDPlistGetPlistObjectType() == 245))
          {
            objc_msgSend(v8, "obj");
            _MDPlistArrayGetPlistObjectAtIndex();
            v11 = v15;
            v12 = v16;
            v10->_obj.reference = v16;
            *(_OWORD *)&v10->_obj.containerBytes = v11;
            v13 = *(_OWORD *)&v10->_obj.containerBytes;
            v16 = v12;
            v15 = v13;
            if (_MDPlistGetPlistObjectType() == 241)
              objc_storeStrong((id *)&v10->_itemsContent, a4);
          }
        }
      }
    }
  }

  return v10;
}

- (unint64_t)count
{
  CSDecoder *items;

  items = self->_items;
  if (items)
    -[CSDecoder obj](items, "obj");
  return _MDPlistArrayGetCount();
}

- (id)objectAtIndex:(unint64_t)a3
{
  CSDecoder *items;
  CSSearchableItemAttributeSet *v5;
  CSDecoder *v6;
  CSSearchableItemAttributeSet *v7;
  void *v8;
  int v9;
  CSDecoder *itemsContent;
  CSSearchableItem *v11;
  void *v12;
  void *v13;
  __int128 v15;
  $37FF168C8709F524D812460C59637AB1 reference;
  __int128 v17;
  $37FF168C8709F524D812460C59637AB1 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v22 = 0uLL;
  v23 = 0;
  items = self->_items;
  if (items)
  {
    -[CSDecoder obj](items, "obj", a3);
  }
  else
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
  }
  _MDPlistArrayGetPlistObjectAtIndex();
  v5 = [CSSearchableItemAttributeSet alloc];
  v6 = self->_items;
  v24 = v22;
  v25 = v23;
  v7 = -[CSSearchableItemAttributeSet initWithDecoder:obj:](v5, "initWithDecoder:obj:", v6, &v24);
  if (self->_itemsContent)
  {
    bzero(&v24, 0x1000uLL);
    -[CSSearchableItemAttributeSet uniqueIdentifier](v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "getCString:maxLength:encoding:", &v24, 4096, 4);

    if (v9)
    {
      v17 = 0uLL;
      v18 = 0;
      v15 = *(_OWORD *)&self->_obj.containerBytes;
      reference = self->_obj.reference;
      if (_MDPlistDictionaryGetPlistObjectForKey())
      {
        itemsContent = self->_itemsContent;
        v15 = v17;
        reference = v18;
        -[CSSearchableItemAttributeSet setContentObj:obj:](v7, "setContentObj:obj:", itemsContent, &v15);
      }
    }
  }
  v11 = -[CSSearchableItem initWithAttributeSet:]([CSSearchableItem alloc], "initWithAttributeSet:", v7);
  -[CSSearchableItemCodedArray bundleID](self, "bundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItem setBundleID:](v11, "setBundleID:", v12);

  -[CSSearchableItemCodedArray protectionClass](self, "protectionClass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItem setProtection:](v11, "setProtection:", v13);

  return v11;
}

- (CSDecoder)items
{
  return self->_items;
}

- (CSDecoder)itemsContent
{
  return self->_itemsContent;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)protectionClass
{
  return self->_protectionClass;
}

- (void)setProtectionClass:(id)a3
{
  objc_storeStrong((id *)&self->_protectionClass, a3);
}

- ($781B0FC3B6CF89EDF0F49E4213B771BC)obj
{
  *($70FB98EE0919CC727AB8FBF44F6186F7 *)retstr = *($70FB98EE0919CC727AB8FBF44F6186F7 *)((char *)self + 40);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_itemsContent, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
